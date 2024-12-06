// Importa o modelo de resposta de autenticação.
import 'package:versaoteste/features/auth/data/models/auth_response.dart';
// Importa o repositório de autenticação para lidar com a lógica de autenticação.
import 'package:versaoteste/features/auth/data/repositories/auth_repository.dart';

/// Classe `LoginWithEmail`.
/// Representa o caso de uso para realizar login com email e senha.
/// Separa a lógica de autenticação do restante da aplicação.
class LoginWithEmail {
  // Instância do AuthRepository, que lida com as operações de autenticação.
  final AuthRepository authRepository;

  // Construtor da classe `LoginWithEmail`.
  // Recebe o repositório de autenticação como dependência (injeção de dependência).
  LoginWithEmail(this.authRepository);

  // Método para realizar o login.
  // Recebe o email e a senha como parâmetros.
  // Retorna uma instância de `AuthResponse`, que contém o status do login.
  Future<AuthResponse> call(String email, String password) async {
    try {
      // Tenta realizar o login usando o repositório de autenticação.
      final user = await authRepository.loginWithEmail(email, password);

      // Verifica se o usuário foi autenticado com sucesso.
      if (user != null) {
        // Retorna uma resposta de sucesso com o ID do usuário.
        return AuthResponse.success(user.id);
      } else {
        // Retorna uma resposta de falha caso o usuário não seja encontrado.
        return AuthResponse.failure('Usuário não encontrado.');
      }
    } catch (e) {
      // Retorna uma resposta de falha caso ocorra um erro durante o login.
      return AuthResponse.failure('Erro ao fazer login: $e');
    }
  }
}
