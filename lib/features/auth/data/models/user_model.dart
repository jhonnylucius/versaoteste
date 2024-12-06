// Classe `UserModel`.
// Representa um usuário com informações como ID, nome, email, imagem de perfil e tipo de usuário.
class UserModel {
  // ID único do usuário, usado para identificá-lo de forma única.
  final String id;

  // Nome do usuário.
  final String name;

  // Email do usuário.
  final String email;

  // URL da imagem de perfil do usuário.
  final String profileImageUrl;

  // Tipo de usuário. Pode ser 'client', 'provider' ou 'both'.
  final String userType;

  // Construtor da classe `UserModel`.
  // Todos os campos são obrigatórios.
  UserModel({
    required this.id, // ID do usuário.
    required this.name, // Nome do usuário.
    required this.email, // Email do usuário.
    required this.profileImageUrl, // URL da imagem de perfil do usuário.
    required this.userType, // Tipo de usuário.
  });

  // Fábrica estática para criar um `UserModel` a partir de um mapa (estrutura chave-valor).
  // Útil para converter dados provenientes de uma API ou banco de dados em um objeto `UserModel`.
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ??
          '', // Obtém o ID ou usa uma string vazia se não estiver disponível.
      name: map['name'] ??
          '', // Obtém o nome ou usa uma string vazia se não estiver disponível.
      email: map['email'] ??
          '', // Obtém o email ou usa uma string vazia se não estiver disponível.
      profileImageUrl: map['profileImageUrl'] ??
          '', // Obtém a URL da imagem ou usa uma string vazia.
      userType: map['userType'] ??
          'client', // Obtém o tipo de usuário ou usa 'client' como padrão.
    );
  }

  // Método que converte o objeto `UserModel` para um mapa (estrutura chave-valor).
  // Útil para enviar dados para uma API ou salvar em um banco de dados.
  Map<String, dynamic> toMap() {
    return {
      'id': id, // ID do usuário.
      'name': name, // Nome do usuário.
      'email': email, // Email do usuário.
      'profileImageUrl': profileImageUrl, // URL da imagem de perfil.
      'userType': userType, // Tipo de usuário.
    };
  }
}
