import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/service_model.dart';

class FirebaseServiceDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ServiceModel>> getServices() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('services').get();

      return querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return ServiceModel.fromJson({
          'id': doc.id,
          ...data,
        });
      }).toList();
    } catch (e) {
      throw Exception("Error fetching services: $e");
    }
  }

  Future<void> bookService(ServiceModel service) async {
    try {
      await _firestore.collection('bookings').add({
        'serviceId': service.id,
        'userId': service.providerId,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception("Error booking service: $e");
    }
  }

  Future<void> cancelBooking(String bookingId) async {
    try {
      await _firestore.collection('bookings').doc(bookingId).delete();
    } catch (e) {
      throw Exception("Error canceling booking: $e");
    }
  }
}
