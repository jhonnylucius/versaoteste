// Importa o modelo de dados `ServiceModel`.
import '../../data/models/service_model.dart';
// Importa o repositório que lida com a lógica de serviços.
import '../../data/repositories/service_repository.dart';

// Classe `BookService`.
// Representa um caso de uso para reservar um serviço.
// Encapsula a lógica de reserva, separando-a do restante da aplicação.
class BookService {
  // Instância do repositório que realiza as operações de serviços.
  final ServiceRepository repository;

  // Construtor da classe `BookService`.
  // Recebe o repositório como dependência (injeção de dependência).
  BookService(this.repository);

  // Método principal para reservar um serviço.
  // Recebe o ID do serviço (`serviceId`) e o ID do usuário (`userId`) como parâmetros.
  Future<void> call(String serviceId, String userId) async {
    try {
      // Chama o método `bookService` do repositório para realizar a reserva.
      // Aqui há um erro no código original: `serviceId` está sendo tratado como um objeto `ServiceModel`.
      // Certifique-se de fornecer um `ServiceModel` diretamente no repositório.
      await repository.bookService(serviceId as ServiceModel, userId);
    } catch (e) {
      // Lança uma exceção personalizada caso ocorra um erro durante a reserva.
      throw Exception("Failed to book service: $e");
    }
  }
}
