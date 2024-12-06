// Classe `ServiceModel`.
// Representa um modelo de serviço, contendo informações como ID, nome, descrição, preço e horários de disponibilidade.
class ServiceModel {
  // ID único do serviço.
  final String id;

  // Nome do serviço.
  final String name;

  // Descrição do serviço.
  final String description;

  // Preço do serviço.
  final double price;

  // ID do provedor responsável pelo serviço.
  final String providerId;

  // Data e horário em que o serviço está disponível a partir de.
  final DateTime availableFrom;

  // Data e horário até quando o serviço está disponível.
  final DateTime availableTo;

  // Construtor da classe `ServiceModel`.
  // Todos os campos são obrigatórios.
  ServiceModel({
    required this.id, // Identificador único do serviço.
    required this.name, // Nome do serviço.
    required this.description, // Descrição do serviço.
    required this.price, // Preço do serviço.
    required this.providerId, // Identificador do provedor.
    required this.availableFrom, // Data e horário de início da disponibilidade.
    required this.availableTo, // Data e horário de término da disponibilidade.
  });

  // Fábrica para criar um objeto `ServiceModel` a partir de um JSON (mapa chave-valor).
  // Útil para converter dados recebidos de APIs ou bancos de dados.
  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'], // Obtém o ID do serviço.
      name: json['name'], // Obtém o nome do serviço.
      description: json['description'], // Obtém a descrição do serviço.
      price: json['price'], // Obtém o preço do serviço.
      providerId: json['providerId'], // Obtém o ID do provedor do serviço.
      availableFrom: DateTime.parse(json[
          'availableFrom']), // Converte a data inicial do formato string para DateTime.
      availableTo: DateTime.parse(json[
          'availableTo']), // Converte a data final do formato string para DateTime.
    );
  }

  // Método para converter um objeto `ServiceModel` em um JSON (mapa chave-valor).
  // Útil para enviar dados para APIs ou salvar em bancos de dados.
  Map<String, dynamic> toJson() {
    return {
      'id': id, // ID do serviço.
      'name': name, // Nome do serviço.
      'description': description, // Descrição do serviço.
      'price': price, // Preço do serviço.
      'providerId': providerId, // ID do provedor do serviço.
      'availableFrom': availableFrom
          .toIso8601String(), // Converte a data inicial para string no formato ISO 8601.
      'availableTo': availableTo
          .toIso8601String(), // Converte a data final para string no formato ISO 8601.
    };
  }
}
