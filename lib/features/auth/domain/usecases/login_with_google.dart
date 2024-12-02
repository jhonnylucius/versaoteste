import 'package:versaoteste/features/auth/data/models/auth_response.dart';
import 'package:versaoteste/features/auth/data/repositories/auth_repository.dart';

class LoginWithGoogle {
  final AuthRepository authRepository;

  LoginWithGoogle(this.authRepository);

  Future<AuthResponse> call() async {
    try {
      final user = await authRepository.loginWithGoogle();
      if (user != null) {
        return AuthResponse.success(user.id);
      } else {
        return AuthResponse.failure('Login com Google cancelado ou falhou.');
      }
    } catch (e) {
      return AuthResponse.failure('Erro ao fazer login com Google: $e');
    }
  }
}
