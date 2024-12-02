import 'package:versaoteste/features/auth/data/models/auth_response.dart';
import 'package:versaoteste/features/auth/data/repositories/auth_repository.dart';

/// Caso de uso para registro de novos usuários
class RegisterUser {
  final AuthRepository authRepository;

  RegisterUser(this.authRepository);

  Future<AuthResponse> call(String email, String password, String name) async {
    try {
      final user =
          await authRepository.registerWithEmail(email, password, name);
      if (user != null) {
        return AuthResponse.success(user.id);
      } else {
        return AuthResponse.failure('Registro falhou. Tente novamente.');
      }
    } catch (e) {
      return AuthResponse.failure('Erro ao registrar usuário: $e');
    }
  }
}
