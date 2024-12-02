
import '../repositories/auth_repository.dart';

/// Caso de uso para registro de novos usuários
class RegisterUser {
  final AuthRepository _repository;

  RegisterUser(this._repository);

  Future<void> call(String email, String password) {
    return _repository.registerUser(email, password);
  }
}
