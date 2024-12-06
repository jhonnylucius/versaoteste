// Importa o pacote Firebase Firestore para interação com o banco de dados.
import 'package:cloud_firestore/cloud_firestore.dart';

// Importa o modelo `ServiceModel`, usado para representar serviços.
import '../models/service_model.dart';

// Classe `FirebaseServiceDatasource`.
// Fornece métodos para interagir com o Firestore relacionados a serviços.
class FirebaseServiceDatasource {
  // Instância do Firestore para realizar operações no banco de dados.
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Método para buscar todos os serviços disponíveis.
  // Retorna uma lista de objetos `ServiceModel`.
  Future<List<ServiceModel>> getServices() async {
    try {
      // Obtém todos os documentos da coleção 'services'.
      QuerySnapshot querySnapshot =
          await _firestore.collection('services').get();

      // Mapeia os documentos retornados para uma lista de `ServiceModel`.
      return querySnapshot.docs.map((doc) {
        // Converte os dados do documento em um mapa.
        final data = doc.data() as Map<String, dynamic>;
        // Cria um `ServiceModel` usando os dados e o ID do documento.
        return ServiceModel.fromJson({
          'id': doc.id, // Adiciona o ID do documento ao mapa de dados.
          ...data, // Inclui todos os outros campos do documento.
        });
      }).toList(); // Converte o `Iterable` em uma lista.
    } catch (e) {
      // Lança uma exceção caso ocorra um erro durante a busca.
      throw Exception("Error fetching services: $e");
    }
  }

  // Método para realizar uma reserva de serviço.
  // Recebe um objeto `ServiceModel` representando o serviço a ser reservado.
  Future<void> bookService(ServiceModel service) async {
    try {
      // Adiciona uma nova reserva à coleção 'bookings'.
      await _firestore.collection('bookings').add({
        'serviceId': service.id, // ID do serviço reservado.
        'userId': service.providerId, // ID do usuário que fornece o serviço.
        'timestamp': FieldValue.serverTimestamp(), // Timestamp do servidor.
      });
    } catch (e) {
      // Lança uma exceção caso ocorra um erro durante a reserva.
      throw Exception("Error booking service: $e");
    }
  }

  // Método para cancelar uma reserva existente.
  // Recebe o `bookingId` como parâmetro, que identifica a reserva a ser cancelada.
  Future<void> cancelBooking(String bookingId) async {
    try {
      // Remove o documento correspondente ao `bookingId` da coleção 'bookings'.
      await _firestore.collection('bookings').doc(bookingId).delete();
    } catch (e) {
      // Lança uma exceção caso ocorra um erro ao cancelar a reserva.
      throw Exception("Error canceling booking: $e");
    }
  }
}
