// Importa o repositório que lida com a lógica de serviços.
import '../../data/repositories/service_repository.dart';
// Importa a entidade `Service`, usada para representar serviços no domínio da aplicação.
import '../entities/service.dart';

// Classe `FetchServices`.
// Representa um caso de uso para buscar a lista de serviços disponíveis.
// Encapsula a lógica de transformação dos dados recebidos do repositório para o formato de entidade.
class FetchServices {
  // Instância do repositório que realiza as operações de serviços.
  final ServiceRepository repository;

  // Construtor da classe `FetchServices`.
  // Recebe o repositório como dependência (injeção de dependência).
  FetchServices(this.repository);

  // Método principal para buscar serviços.
  // Retorna uma lista de objetos do tipo `Service`.
  Future<List<Service>> call() async {
    // Busca a lista de modelos de serviço (`ServiceModel`) do repositório.
    final serviceModels = await repository.fetchServices();

    // Converte cada `ServiceModel` em uma entidade `Service`.
    return serviceModels.map((model) {
      return Service(
        id: model.id, // ID do serviço.
        name: model.name, // Nome do serviço.
        description: model.description, // Descrição do serviço.
        price: model.price, // Preço do serviço.
        providerId: model.providerId, // ID do provedor do serviço.
        availableFrom:
            model.availableFrom, // Data de início da disponibilidade.
        availableTo: model.availableTo, // Data de término da disponibilidade.
      );
    }).toList(); // Converte o resultado em uma lista.
  }
}
