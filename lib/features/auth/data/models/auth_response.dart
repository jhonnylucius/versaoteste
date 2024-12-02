class AuthResponse {
  final bool success;
  final String? message;
  final String? userId;

  AuthResponse({
    required this.success,
    this.message,
    this.userId,
  });

  factory AuthResponse.success(String userId) {
    return AuthResponse(success: true, userId: userId, message: null);
  }

  factory AuthResponse.failure(String message) {
    return AuthResponse(success: false, message: message, userId: null);
  }
}
