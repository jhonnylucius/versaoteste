
import '../data/models/user_model.dart';
import '../repositories/auth_repository.dart';

/// Caso de uso para login com Facebook
class LoginWithFacebook {
  final AuthRepository _repository;

  LoginWithFacebook(this._repository);

  Future<UserModel?> call() {
    return _repository.loginWithFacebook();
  }
}
