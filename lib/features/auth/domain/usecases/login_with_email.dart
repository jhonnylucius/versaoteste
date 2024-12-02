import 'package:versaoteste/features/auth/data/models/auth_response.dart';
import 'package:versaoteste/features/auth/data/models/user_model.dart';
import 'package:versaoteste/features/auth/data/repositories/auth_repository.dart';

/// Caso de uso para login com email e senha
class LoginWithEmail {
  final AuthRepository authRepository;

  LoginWithEmail(this.authRepository);

  Future<AuthResponse> call(String email, String password) async {
    try {
      final user = await authRepository.loginWithEmail(email, password);
      if (user != null) {
        return AuthResponse.success(user.id);
      } else {
        return AuthResponse.failure('Usuário não encontrado.');
      }
    } catch (e) {
      return AuthResponse.failure('Erro ao fazer login: $e');
    }
  }
}
