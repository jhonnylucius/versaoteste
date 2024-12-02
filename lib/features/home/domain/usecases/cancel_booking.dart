import '../../data/repositories/service_repository.dart';

class CancelBooking {
  final ServiceRepository repository;

  CancelBooking(this.repository);

  Future<void> call(String bookingId) async {
    try {
      await repository.cancelServiceBooking(bookingId);
    } catch (e) {
      throw Exception("Failed to cancel booking: $e");
    }
  }
}
