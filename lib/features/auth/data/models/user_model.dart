
/// Modelo de usuário para representar os dados autenticados
class UserModel {
  final String userId;
  final String email;
  final String? displayName;
  final String? photoUrl;

  UserModel({
    required this.userId,
    required this.email,
    this.displayName,
    this.photoUrl,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      userId: data['userId'],
      email: data['email'],
      displayName: data['displayName'],
      photoUrl: data['photoUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
    };
  }
}
