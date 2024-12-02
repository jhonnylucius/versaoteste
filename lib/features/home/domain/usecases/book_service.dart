import '../../data/models/service_model.dart';
import '../../data/repositories/service_repository.dart';

class BookService {
  final ServiceRepository repository;

  BookService(this.repository);

  Future<void> call(String serviceId, String userId) async {
    try {
      await repository.bookService(serviceId as ServiceModel, userId);
    } catch (e) {
      throw Exception("Failed to book service: $e");
    }
  }
}
