import '../datasources/firebase_service_datasource.dart';
import '../models/service_model.dart';

class ServiceRepository {
  final FirebaseServiceDatasource _dataSource;

  ServiceRepository(this._dataSource);

  Future<List<ServiceModel>> fetchServices() async {
    try {
      return await _dataSource.getServices();
    } catch (e) {
      throw Exception("Error fetching services: $e");
    }
  }

  Future<void> bookService(ServiceModel service, String userId) async {
    try {
      await _dataSource.bookService(service);
    } catch (e) {
      throw Exception("Error booking service: $e");
    }
  }

  Future<void> cancelServiceBooking(String bookingId) async {
    try {
      await _dataSource.cancelBooking(bookingId);
    } catch (e) {
      throw Exception("Error canceling booking: $e");
    }
  }
}
