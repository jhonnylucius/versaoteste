// Classe `AuthResponse`.
// Representa a resposta de uma operação de autenticação, contendo informações sobre o sucesso,
// uma mensagem de erro (caso exista), e o ID do usuário (caso a operação seja bem-sucedida).
class AuthResponse {
  // Propriedade que indica se a operação foi bem-sucedida.
  final bool success;

  // Propriedade que contém uma mensagem de erro ou de status, opcional.
  final String? message;

  // Propriedade que armazena o ID do usuário, opcional.
  // Será preenchida apenas em casos de sucesso.
  final String? userId;

  // Construtor da classe `AuthResponse`.
  // O campo `success` é obrigatório, enquanto `message` e `userId` são opcionais.
  AuthResponse({
    required this.success, // Indica se a operação foi bem-sucedida.
    this.message, // Mensagem de status ou erro (opcional).
    this.userId, // ID do usuário (opcional).
  });

  // Fábrica estática para criar uma instância de sucesso.
  // Recebe o `userId` como parâmetro e preenche as propriedades apropriadas.
  factory AuthResponse.success(String userId) {
    return AuthResponse(
      success: true, // A operação foi bem-sucedida.
      userId: userId, // Define o ID do usuário.
      message: null, // Nenhuma mensagem de erro, pois foi um sucesso.
    );
  }

  // Fábrica estática para criar uma instância de falha.
  // Recebe uma `message` que descreve o motivo do erro.
  factory AuthResponse.failure(String message) {
    return AuthResponse(
      success: false, // A operação falhou.
      message: message, // Define a mensagem de erro.
      userId: null, // Não há ID de usuário, pois a operação não teve sucesso.
    );
  }
}
