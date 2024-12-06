// Classe `User`.
// Representa um usuário com informações básicas como ID, nome, email, URL da foto de perfil e tipo de usuário.
class User {
  // ID único do usuário.
  final String id;

  // Nome completo do usuário.
  final String name;

  // Email do usuário.
  final String email;

  // URL da foto de perfil do usuário.
  final String profilePictureUrl;

  // Tipo de usuário, que pode ser "Cliente", "Prestador" ou "Ambos".
  final String userType;

  // Construtor da classe `User`.
  // Todos os campos são obrigatórios.
  User({
    required this.id, // Identificador único do usuário.
    required this.name, // Nome do usuário.
    required this.email, // Email do usuário.
    required this.profilePictureUrl, // URL da foto de perfil do usuário.
    required this.userType, // Tipo de usuário.
  });

  // Fábrica para criar um objeto `User` a partir de um `Map` (estrutura chave-valor).
  // Útil para converter dados recebidos de um banco de dados (como Firestore) em uma instância da classe `User`.
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ??
          '', // Obtém o ID do mapa ou usa uma string vazia como padrão.
      name: map['name'] ??
          '', // Obtém o nome do mapa ou usa uma string vazia como padrão.
      email: map['email'] ??
          '', // Obtém o email do mapa ou usa uma string vazia como padrão.
      profilePictureUrl: map['profilePictureUrl'] ??
          '', // Obtém a URL da foto ou usa uma string vazia.
      userType: map['userType'] ??
          'Cliente', // Obtém o tipo de usuário ou usa "Cliente" como padrão.
    );
  }

  // Método para converter um objeto `User` em um `Map` (estrutura chave-valor).
  // Útil para salvar ou atualizar os dados de um usuário em um banco de dados (como Firestore).
  Map<String, dynamic> toMap() {
    return {
      'id': id, // Armazena o ID do usuário.
      'name': name, // Armazena o nome do usuário.
      'email': email, // Armazena o email do usuário.
      'profilePictureUrl':
          profilePictureUrl, // Armazena a URL da foto de perfil do usuário.
      'userType': userType, // Armazena o tipo do usuário.
    };
  }
}
