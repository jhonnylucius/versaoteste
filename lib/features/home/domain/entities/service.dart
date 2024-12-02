class Service {
  final String id;
  final String name;
  final String description;
  final double price;
  final String providerId;
  final DateTime availableFrom;
  final DateTime availableTo;

  Service({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.providerId,
    required this.availableFrom,
    required this.availableTo,
  });
}
