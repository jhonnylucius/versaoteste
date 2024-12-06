// Importa o pacote do Firebase Authentication para autenticação de usuários.
import 'package:firebase_auth/firebase_auth.dart';
// Importa o pacote para login com Facebook.
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// Importa o pacote para login com Google.
import 'package:google_sign_in/google_sign_in.dart';
// Importa o modelo de usuário definido no projeto.
import 'package:versaoteste/features/auth/data/models/user_model.dart';

/// Classe `FirebaseAuthDatasource`.
/// Responsável por lidar com operações de autenticação usando o Firebase Authentication.
class FirebaseAuthDatasource {
  // Instância do Firebase Authentication.
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// Método para realizar login com email e senha.
  /// Retorna um objeto `UserModel` em caso de sucesso ou lança uma exceção em caso de erro.
  Future<UserModel?> loginWithEmail(String email, String password) async {
    try {
      // Realiza login com email e senha.
      UserCredential credential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Converte o usuário do Firebase para o modelo `UserModel`.
      return _userFromFirebaseUser(credential.user);
    } catch (e) {
      // Lança uma exceção com uma mensagem de erro em caso de falha.
      throw Exception("Erro ao fazer login: \$e");
    }
  }

  /// Método para realizar login com Google.
  /// Retorna um objeto `UserModel` em caso de sucesso ou lança uma exceção em caso de erro.
  Future<UserModel?> loginWithGoogle() async {
    try {
      // Inicia o fluxo de login com Google.
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtém as credenciais de autenticação do Google.
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Cria as credenciais do Firebase a partir das credenciais do Google.
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Realiza login no Firebase com as credenciais do Google.
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      // Converte o usuário do Firebase para o modelo `UserModel`.
      return _userFromFirebaseUser(userCredential.user);
    } catch (e) {
      // Lança uma exceção com uma mensagem de erro em caso de falha.
      throw Exception("Erro ao fazer login com Google: \$e");
    }
  }

  /// Método para realizar login com Facebook.
  /// Retorna um objeto `UserModel` em caso de sucesso ou lança uma exceção em caso de erro.
  Future<UserModel?> loginWithFacebook() async {
    try {
      // Inicia o fluxo de login com Facebook.
      final LoginResult result = await FacebookAuth.instance.login();

      // Verifica se o login foi bem-sucedido.
      if (result.status == LoginStatus.success) {
        // Obtém o token de acesso do Facebook.
        final AccessToken? accessToken = result.accessToken;

        // Verifica se o token é nulo.
        if (accessToken == null) {
          throw Exception('AccessToken is null');
        }

        // Cria as credenciais do Firebase a partir do token do Facebook.
        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.tokenString);

        // Realiza login no Firebase com as credenciais do Facebook.
        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);

        // Converte o usuário do Firebase para o modelo `UserModel`.
        return _userFromFirebaseUser(userCredential.user);
      } else {
        throw Exception('Facebook login failed: ${result.message}');
      }
    } catch (e) {
      // Lança uma exceção com uma mensagem de erro em caso de falha.
      throw Exception('Error logging in with Facebook: $e');
    }
  }

  /// Método para registrar um novo usuário com email e senha.
  /// Lança uma exceção em caso de erro.
  Future<void> registerUser(String email, String password) async {
    try {
      // Registra um novo usuário com email e senha.
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      // Lança uma exceção com uma mensagem de erro em caso de falha.
      throw Exception("Erro ao registrar usuário: \$e");
    }
  }

  /// Método privado para converter um objeto `User` do Firebase em `UserModel`.
  UserModel? _userFromFirebaseUser(User? user) {
    if (user == null) return null;

    // Retorna uma instância do modelo `UserModel` com os dados do usuário do Firebase.
    return UserModel(
      id: user.uid, // ID único do usuário.
      name:
          user.displayName ?? '', // Nome do usuário (ou vazio se não definido).
      email: user.email ?? '', // Email do usuário (ou vazio se não definido).
      profileImageUrl: user.photoURL ??
          '', // URL da foto de perfil (ou vazio se não definido).
      userType: 'default', // Tipo de usuário (pode ser personalizado).
    );
  }
}
