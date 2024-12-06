// Importa o modelo de resposta de autenticação.
import 'package:versaoteste/features/auth/data/models/auth_response.dart';
// Importa o repositório de autenticação para lidar com a lógica de registro.
import 'package:versaoteste/features/auth/data/repositories/auth_repository.dart';

/// Classe `RegisterUser`.
/// Representa o caso de uso para registro de novos usuários.
/// Encapsula a lógica de registro para separá-la do restante da aplicação.
class RegisterUser {
  // Instância do AuthRepository, que lida com as operações de autenticação e registro.
  final AuthRepository authRepository;

  // Construtor da classe `RegisterUser`.
  // Recebe o repositório de autenticação como dependência (injeção de dependência).
  RegisterUser(this.authRepository);

  // Método principal para realizar o registro.
  // Recebe o email, senha e nome do usuário como parâmetros.
  // Retorna uma instância de `AuthResponse`, que encapsula o status do registro.
  Future<AuthResponse> call(String email, String password, String name) async {
    try {
      // Tenta registrar o usuário usando o repositório de autenticação.
      final user =
          await authRepository.registerWithEmail(email, password, name);

      // Verifica se o usuário foi registrado com sucesso.
      if (user != null) {
        // Retorna uma resposta de sucesso com o ID do usuário.
        return AuthResponse.success(user.id);
      } else {
        // Retorna uma resposta de falha caso o registro não seja bem-sucedido.
        return AuthResponse.failure('Registro falhou. Tente novamente.');
      }
    } catch (e) {
      // Retorna uma resposta de falha caso ocorra um erro durante o registro.
      return AuthResponse.failure('Erro ao registrar usuário: $e');
    }
  }
}
