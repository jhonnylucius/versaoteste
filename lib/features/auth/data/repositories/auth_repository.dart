import 'package:versaoteste/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:versaoteste/features/auth/data/models/user_model.dart';

/// Repositório de autenticação que conecta a camada de domínio ao datasource
class AuthRepository {
  final FirebaseAuthDatasource _datasource;

  AuthRepository(this._datasource);

  Future<UserModel?> loginWithEmail(String email, String password) {
    return _datasource.loginWithEmail(email, password);
  }

  Future<UserModel?> loginWithGoogle() {
    return _datasource.loginWithGoogle();
  }

  Future<UserModel?> loginWithFacebook() {
    return _datasource.loginWithFacebook();
  }

  Future<void> registerUser(String email, String password) {
    return _datasource.registerUser(email, password);
  }
}
