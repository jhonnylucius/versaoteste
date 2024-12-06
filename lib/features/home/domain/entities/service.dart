// Classe `Service`.
// Representa um modelo de dados para um serviço, com informações básicas como ID, nome, descrição, preço e horários de disponibilidade.
class Service {
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

  // Data e hora em que o serviço está disponível a partir de.
  final DateTime availableFrom;

  // Data e hora até quando o serviço está disponível.
  final DateTime availableTo;

  // Construtor da classe `Service`.
  // Todos os campos são obrigatórios para garantir que os objetos criados estejam completamente definidos.
  Service({
    required this.id, // Identificador único do serviço.
    required this.name, // Nome do serviço.
    required this.description, // Descrição do serviço.
    required this.price, // Preço do serviço.
    required this.providerId, // Identificador do provedor que oferece o serviço.
    required this.availableFrom, // Data e hora de início da disponibilidade.
    required this.availableTo, // Data e hora de término da disponibilidade.
  });
}
