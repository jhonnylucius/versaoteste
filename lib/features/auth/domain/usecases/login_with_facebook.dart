// Importa o modelo de resposta de autenticação.
import 'package:versaoteste/features/auth/data/models/auth_response.dart';
// Importa o repositório de autenticação para lidar com a lógica de autenticação.
import 'package:versaoteste/features/auth/data/repositories/auth_repository.dart';

/// Classe `LoginWithFacebook`.
/// Representa o caso de uso para realizar login com Facebook.
/// Encapsula a lógica de autenticação com Facebook para separá-la do restante da aplicação.
class LoginWithFacebook {
  // Instância do AuthRepository, que lida com as operações de autenticação.
  final AuthRepository authRepository;

  // Construtor da classe `LoginWithFacebook`.
  // Recebe o repositório de autenticação como dependência (injeção de dependência).
  LoginWithFacebook(this.authRepository);

  // Método principal para realizar o login.
  // Não requer parâmetros adicionais, pois a autenticação com Facebook usa a conta conectada.
  // Retorna uma instância de `AuthResponse`, que encapsula o status do login.
  Future<AuthResponse> call() async {
    try {
      // Tenta realizar o login usando o repositório de autenticação.
      final user = await authRepository.loginWithFacebook();

      // Verifica se o usuário foi autenticado com sucesso.
      if (user != null) {
        // Retorna uma resposta de sucesso com o ID do usuário.
        return AuthResponse.success(user.id);
      } else {
        // Retorna uma resposta de falha caso o login tenha sido cancelado ou falhado.
        return AuthResponse.failure('Login com Facebook cancelado ou falhou.');
      }
    } catch (e) {
      // Retorna uma resposta de falha caso ocorra um erro durante o login.
      return AuthResponse.failure('Erro ao fazer login com Facebook: $e');
    }
  }
}
