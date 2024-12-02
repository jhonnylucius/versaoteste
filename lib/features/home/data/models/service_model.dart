class ServiceModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String providerId;
  final DateTime availableFrom;
  final DateTime availableTo;

  ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.providerId,
    required this.availableFrom,
    required this.availableTo,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      providerId: json['providerId'],
      availableFrom: DateTime.parse(json['availableFrom']),
      availableTo: DateTime.parse(json['availableTo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'providerId': providerId,
      'availableFrom': availableFrom.toIso8601String(),
      'availableTo': availableTo.toIso8601String(),
    };
  }
}
