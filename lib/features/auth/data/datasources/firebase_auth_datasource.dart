import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:versaoteste/features/auth/data/models/user_model.dart';

/// Datasource para lidar com a autenticação Firebase
class FirebaseAuthDatasource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel?> loginWithEmail(String email, String password) async {
    try {
      UserCredential credential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebaseUser(credential.user);
    } catch (e) {
      throw Exception("Erro ao fazer login: \$e");
    }
  }

  Future<UserModel?> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return _userFromFirebaseUser(userCredential.user);
    } catch (e) {
      throw Exception("Erro ao fazer login com Google: \$e");
    }
  }

  Future<UserModel?> loginWithFacebook() async {
    try {
      final result = await FacebookAuth.instance.login();
      final credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return _userFromFirebaseUser(userCredential.user);
    } catch (e) {
      throw Exception("Erro ao fazer login com Facebook: \$e");
    }
  }

  Future<void> registerUser(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw Exception("Erro ao registrar usuário: \$e");
    }
  }

  UserModel? _userFromFirebaseUser(User? user) {
    if (user == null) return null;
    return UserModel(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      profileImageUrl: user.photoURL ?? '',
      userType: 'default', // or any appropriate value
    );
  }
}
