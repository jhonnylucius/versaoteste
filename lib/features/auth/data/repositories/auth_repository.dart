// Importa os pacotes necessários para autenticação com Firebase, Google e Facebook.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:versaoteste/features/auth/data/models/user_model.dart';

// Classe AuthRepository.
// Gerencia operações de autenticação, como login, registro e logout,
// utilizando o Firebase, Google e Facebook.
class AuthRepository {
  // Instância do FirebaseAuth para autenticação com Firebase.
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Instância do GoogleSignIn para login com Google.
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Instância do FacebookAuth para login com Facebook.
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  // Método para login com email e senha.
  // Retorna um objeto UserModel correspondente ao usuário autenticado, ou null em caso de falha.
  Future<UserModel?> loginWithEmail(String email, String password) async {
    try {
      // Autentica o usuário no Firebase usando email e senha.
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Converte o usuário do Firebase para um modelo customizado UserModel.
      return _userFromFirebase(userCredential.user);
    } catch (e) {
      // Lança uma exceção caso ocorra um erro no login.
      throw Exception('Erro ao fazer login com email e senha: $e');
    }
  }

  // Método para registro com email, senha e nome.
  // Retorna um objeto UserModel correspondente ao usuário registrado, ou null em caso de falha.
  Future<UserModel?> registerWithEmail(
      String email, String password, String name) async {
    try {
      // Registra um novo usuário no Firebase usando email e senha.
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Atualiza o nome de exibição do usuário.
      await userCredential.user?.updateDisplayName(name);
      // Converte o usuário do Firebase para um modelo customizado UserModel.
      return _userFromFirebase(userCredential.user);
    } catch (e) {
      // Lança uma exceção caso ocorra um erro no registro.
      throw Exception('Erro ao registrar com email e senha: $e');
    }
  }

  // Método para login com Google.
  // Retorna um objeto UserModel correspondente ao usuário autenticado, ou null se o login for cancelado.
  Future<UserModel?> loginWithGoogle() async {
    try {
      // Inicia o processo de login com Google.
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null)
        return null; // Retorna null se o login for cancelado.

      // Obtém as credenciais de autenticação do Google.
      final googleAuth = await googleUser.authentication;
      // Cria credenciais do Firebase usando as credenciais do Google.
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Autentica o usuário no Firebase usando as credenciais do Google.
      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      // Converte o usuário do Firebase para um modelo customizado UserModel.
      return _userFromFirebase(userCredential.user);
    } catch (e) {
      // Lança uma exceção caso ocorra um erro no login com Google.
      throw Exception('Erro ao fazer login com Google: $e');
    }
  }

  // Método para login com Facebook.
  // Retorna um objeto UserModel correspondente ao usuário autenticado, ou null em caso de falha.
  Future<UserModel?> loginWithFacebook() async {
    try {
      // Inicia o processo de login com Facebook.
      final LoginResult result = await FacebookAuth.instance.login();
      // Verifica se o login foi bem-sucedido.
      if (result.status == LoginStatus.success) {
        // Obtém o token de acesso do Facebook.
        final AccessToken? accessToken = result.accessToken;
        if (accessToken == null) {
          // Lança uma exceção se o token de acesso for nulo.
          throw Exception('AccessToken is null');
        }

        // Cria credenciais do Firebase usando o token do Facebook.
        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.tokenString);

        // Autentica o usuário no Firebase usando as credenciais do Facebook.
        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);

        // Converte o usuário do Firebase para um modelo customizado UserModel.
        return _userFromFirebase(userCredential.user);
      } else {
        // Lança uma exceção caso o login do Facebook falhe.
        throw Exception('Facebook login failed: ${result.message}');
      }
    } catch (e) {
      // Lança uma exceção caso ocorra um erro no login com Facebook.
      throw Exception('Error logging in with Facebook: $e');
    }
  }

  // Método para logout.
  // Desconecta o usuário de todas as plataformas (Firebase, Google e Facebook).
  Future<void> logout() async {
    // Desconecta o usuário do Firebase.
    await _firebaseAuth.signOut();
    // Desconecta o usuário do Google.
    await _googleSignIn.signOut();
    // Desconecta o usuário do Facebook.
    await _facebookAuth.logOut();
  }

  // Método privado para converter um objeto User do Firebase em um modelo customizado UserModel.
  // Retorna null se o usuário for nulo.
  UserModel? _userFromFirebase(User? user) {
    if (user == null) return null; // Retorna null se o usuário for nulo.

    // Retorna um objeto UserModel preenchido com os dados do usuário do Firebase.
    return UserModel(
      id: user.uid, // ID único do usuário.
      name: user.displayName ??
          'Usuário', // Nome de exibição ou 'Usuário' se nulo.
      email: user.email ?? '', // Email do usuário ou string vazia se nulo.
      profileImageUrl: user.photoURL ??
          '', // URL da imagem de perfil ou string vazia se nulo.
      userType: 'client', // Tipo de usuário padrão para este exemplo.
    );
  }
}
