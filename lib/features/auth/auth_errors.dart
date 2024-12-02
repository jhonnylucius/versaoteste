
class AuthErrors {
  static String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'invalid-email':
        return 'O e-mail fornecido é inválido.';
      case 'user-disabled':
        return 'A conta do usuário foi desativada.';
      case 'user-not-found':
        return 'Usuário não encontrado. Verifique o e-mail e tente novamente.';
      case 'wrong-password':
        return 'A senha fornecida está incorreta.';
      case 'email-already-in-use':
        return 'O e-mail fornecido já está em uso por outra conta.';
      case 'weak-password':
        return 'A senha fornecida é muito fraca. Use uma senha mais forte.';
      case 'operation-not-allowed':
        return 'Esta operação não está permitida no momento.';
      case 'network-request-failed':
        return 'Falha na conexão de rede. Verifique sua conexão e tente novamente.';
      default:
        return 'Ocorreu um erro desconhecido. Tente novamente mais tarde.';
    }
  }
}
