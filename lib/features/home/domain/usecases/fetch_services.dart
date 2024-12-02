import '../../data/repositories/service_repository.dart';
import '../entities/service.dart';

class FetchServices {
  final ServiceRepository repository;

  FetchServices(this.repository);

  Future<List<Service>> call() async {
    final serviceModels = await repository.fetchServices();
    return serviceModels.map((model) {
      return Service(
        id: model.id,
        name: model.name,
        description: model.description,
        price: model.price,
        providerId: model.providerId,
        availableFrom: model.availableFrom,
        availableTo: model.availableTo,
      );
    }).toList();
  }
}
