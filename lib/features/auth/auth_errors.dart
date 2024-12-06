// Classe `AuthErrors`.
// Fornece uma forma centralizada de traduzir códigos de erro em mensagens amigáveis para o usuário.
class AuthErrors {
  // Método estático `getErrorMessage`.
  // Recebe um código de erro (`errorCode`) como parâmetro e retorna uma mensagem descritiva.
  static String getErrorMessage(String errorCode) {
    // Usa um `switch` para mapear os códigos de erro conhecidos para mensagens específicas.
    switch (errorCode) {
      case 'invalid-email':
        // Mensagem retornada quando o email fornecido é inválido.
        return 'O e-mail fornecido é inválido.';
      case 'user-disabled':
        // Mensagem retornada quando a conta do usuário foi desativada.
        return 'A conta do usuário foi desativada.';
      case 'user-not-found':
        // Mensagem retornada quando o email fornecido não corresponde a nenhum usuário.
        return 'Usuário não encontrado. Verifique o e-mail e tente novamente.';
      case 'wrong-password':
        // Mensagem retornada quando a senha fornecida está incorreta.
        return 'A senha fornecida está incorreta.';
      case 'email-already-in-use':
        // Mensagem retornada quando o email fornecido já está em uso por outra conta.
        return 'O e-mail fornecido já está em uso por outra conta.';
      case 'weak-password':
        // Mensagem retornada quando a senha fornecida é considerada muito fraca.
        return 'A senha fornecida é muito fraca. Use uma senha mais forte.';
      case 'operation-not-allowed':
        // Mensagem retornada quando a operação solicitada não é permitida.
        return 'Esta operação não está permitida no momento.';
      case 'network-request-failed':
        // Mensagem retornada quando há falha na conexão de rede.
        return 'Falha na conexão de rede. Verifique sua conexão e tente novamente.';
      default:
        // Mensagem padrão para códigos de erro desconhecidos.
        return 'Ocorreu um erro desconhecido. Tente novamente mais tarde.';
    }
  }
}
