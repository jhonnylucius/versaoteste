
import '../data/models/user_model.dart';
import '../repositories/auth_repository.dart';

/// Caso de uso para login com email e senha
class LoginWithEmail {
  final AuthRepository _repository;

  LoginWithEmail(this._repository);

  Future<UserModel?> call(String email, String password) {
    return _repository.loginWithEmail(email, password);
  }
}
