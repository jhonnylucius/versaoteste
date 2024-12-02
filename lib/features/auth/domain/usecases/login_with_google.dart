
import '../data/models/user_model.dart';
import '../repositories/auth_repository.dart';

/// Caso de uso para login com Google
class LoginWithGoogle {
  final AuthRepository _repository;

  LoginWithGoogle(this._repository);

  Future<UserModel?> call() {
    return _repository.loginWithGoogle();
  }
}
