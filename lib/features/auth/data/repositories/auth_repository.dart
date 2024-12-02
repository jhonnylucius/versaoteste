import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:versaoteste/features/auth/data/models/user_model.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  // Login com Email e Senha
  Future<UserModel?> loginWithEmail(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebase(userCredential.user);
    } catch (e) {
      throw Exception('Erro ao fazer login com email e senha: $e');
    }
  }

  // Registro com Email e Senha
  Future<UserModel?> registerWithEmail(
      String email, String password, String name) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user?.updateDisplayName(name);
      return _userFromFirebase(userCredential.user);
    } catch (e) {
      throw Exception('Erro ao registrar com email e senha: $e');
    }
  }

  // Login com Google
  Future<UserModel?> loginWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return _userFromFirebase(userCredential.user);
    } catch (e) {
      throw Exception('Erro ao fazer login com Google: $e');
    }
  }

  // Login com Facebook
  Future<UserModel?> loginWithFacebook() async {
    try {
      final result = await _facebookAuth.login();
      if (result.status == LoginStatus.success) {
        final credential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        final userCredential =
            await _firebaseAuth.signInWithCredential(credential);
        return _userFromFirebase(userCredential.user);
      }
      return null;
    } catch (e) {
      throw Exception('Erro ao fazer login com Facebook: $e');
    }
  }

  // Logout
  Future<void> logout() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
    await _facebookAuth.logOut();
  }

  // Converter Firebase User para UserModel
  UserModel? _userFromFirebase(User? user) {
    if (user == null) return null;
    return UserModel(
      id: user.uid,
      name: user.displayName ?? 'Usuário',
      email: user.email ?? '',
      profileImageUrl: user.photoURL ?? '',
      userType: 'client', // Default para este exemplo
    );
  }
}
