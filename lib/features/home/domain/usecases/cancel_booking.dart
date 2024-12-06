// Importa o repositório que lida com a lógica de serviços.
import '../../data/repositories/service_repository.dart';

// Classe `CancelBooking`.
// Representa um caso de uso para cancelar uma reserva de serviço.
// Encapsula a lógica de cancelamento, separando-a do restante da aplicação.
class CancelBooking {
  // Instância do repositório que realiza as operações de serviços.
  final ServiceRepository repository;

  // Construtor da classe `CancelBooking`.
  // Recebe o repositório como dependência (injeção de dependência).
  CancelBooking(this.repository);

  // Método principal para cancelar uma reserva.
  // Recebe o ID da reserva (`bookingId`) como parâmetro.
  Future<void> call(String bookingId) async {
    try {
      // Chama o método `cancelServiceBooking` do repositório para cancelar a reserva.
      await repository.cancelServiceBooking(bookingId);
    } catch (e) {
      // Lança uma exceção personalizada caso ocorra um erro durante o cancelamento.
      throw Exception("Failed to cancel booking: $e");
    }
  }
}
