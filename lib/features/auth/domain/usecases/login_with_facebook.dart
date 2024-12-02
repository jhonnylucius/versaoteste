import 'package:versaoteste/features/auth/data/models/auth_response.dart';
import 'package:versaoteste/features/auth/data/repositories/auth_repository.dart';

class LoginWithFacebook {
  final AuthRepository authRepository;

  LoginWithFacebook(this.authRepository);

  Future<AuthResponse> call() async {
    try {
      final user = await authRepository.loginWithFacebook();
      if (user != null) {
        return AuthResponse.success(user.id);
      } else {
        return AuthResponse.failure('Login com Facebook cancelado ou falhou.');
      }
    } catch (e) {
      return AuthResponse.failure('Erro ao fazer login com Facebook: $e');
    }
  }
}
