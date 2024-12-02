
class User {
  final String id;
  final String name;
  final String email;
  final String profilePictureUrl;
  final String userType; // Cliente, Prestador ou Ambos

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePictureUrl,
    required this.userType,
  });

  // Método para converter de Map (como no Firestore) para User
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      profilePictureUrl: map['profilePictureUrl'] ?? '',
      userType: map['userType'] ?? 'Cliente',
    );
  }

  // Método para converter de User para Map (para salvar no Firestore)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
      'userType': userType,
    };
  }
}
