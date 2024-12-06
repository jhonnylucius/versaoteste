// Importa o datasource que lida diretamente com o Firebase.
import '../datasources/firebase_service_datasource.dart';
// Importa o modelo `ServiceModel`, usado para representar serviços.
import '../models/service_model.dart';

// Classe `ServiceRepository`.
// Atua como um repositório para encapsular a lógica de negócios relacionada a serviços,
// separando-a do datasource que interage diretamente com o Firebase.
class ServiceRepository {
  // Instância do datasource que realiza as operações no Firebase.
  final FirebaseServiceDatasource _dataSource;

  // Construtor da classe `ServiceRepository`.
  // Recebe o datasource como dependência (injeção de dependência).
  ServiceRepository(this._dataSource);

  // Método para buscar todos os serviços disponíveis.
  // Retorna uma lista de objetos `ServiceModel`.
  Future<List<ServiceModel>> fetchServices() async {
    try {
      // Chama o método do datasource para buscar os serviços.
      return await _dataSource.getServices();
    } catch (e) {
      // Lança uma exceção personalizada caso ocorra um erro.
      throw Exception("Error fetching services: $e");
    }
  }

  // Método para reservar um serviço.
  // Recebe um objeto `ServiceModel` representando o serviço a ser reservado
  // e o `userId` do usuário que está reservando o serviço.
  Future<void> bookService(ServiceModel service, String userId) async {
    try {
      // Chama o método do datasource para realizar a reserva.
      await _dataSource.bookService(service);
    } catch (e) {
      // Lança uma exceção personalizada caso ocorra um erro.
      throw Exception("Error booking service: $e");
    }
  }

  // Método para cancelar uma reserva de serviço.
  // Recebe o `bookingId`, que identifica a reserva a ser cancelada.
  Future<void> cancelServiceBooking(String bookingId) async {
    try {
      // Chama o método do datasource para cancelar a reserva.
      await _dataSource.cancelBooking(bookingId);
    } catch (e) {
      // Lança uma exceção personalizada caso ocorra um erro.
      throw Exception("Error canceling booking: $e");
    }
  }
}
