// Declaração da classe `Validators`.
// Essa classe contém métodos estáticos que ajudam a validar entradas de dados,
// como e-mails, senhas e nomes, em formulários de aplicativos.
class Validators {
  // Método estático para validar e-mails.
  // Retorna uma mensagem de erro caso o e-mail seja inválido ou `null` se estiver válido.
  static String? validateEmail(String? value) {
    // Verifica se o valor é nulo ou vazio.
    // Caso seja, retorna uma mensagem indicando que o campo é obrigatório.
    if (value == null || value.isEmpty) {
      return 'O e-mail é obrigatório';
    }

    // Declara uma expressão regular (regex) para validar o formato do e-mail.
    // A regex aceita caracteres alfanuméricos, ".", "_", "%", "+", "-", seguido de um "@",
    // domínio e uma extensão de pelo menos 2 caracteres (exemplo: ".com").
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\$');

    // Verifica se o valor não corresponde ao padrão da regex.
    // Se não corresponder, retorna uma mensagem indicando que o e-mail é inválido.
    if (!emailRegex.hasMatch(value)) {
      return 'E-mail inválido';
    }

    // Retorna `null` se o e-mail for válido, indicando que não há erros.
    return null;
  }

  // Método estático para validar senhas.
  // Retorna uma mensagem de erro caso a senha seja inválida ou `null` se estiver válida.
  static String? validatePassword(String? value) {
    // Verifica se o valor é nulo ou vazio.
    // Caso seja, retorna uma mensagem indicando que o campo é obrigatório.
    if (value == null || value.isEmpty) {
      return 'A senha é obrigatória';
    }

    // Verifica se o comprimento da senha é menor que 6 caracteres.
    // Caso seja, retorna uma mensagem indicando o mínimo necessário.
    if (value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres';
    }

    // Retorna `null` se a senha for válida, indicando que não há erros.
    return null;
  }

  // Método estático para validar nomes.
  // Retorna uma mensagem de erro caso o nome seja inválido ou `null` se estiver válido.
  static String? validateName(String? value) {
    // Verifica se o valor é nulo ou vazio.
    // Caso seja, retorna uma mensagem indicando que o campo é obrigatório.
    if (value == null || value.isEmpty) {
      return 'O nome é obrigatório';
    }

    // Verifica se o comprimento do nome é menor que 3 caracteres.
    // Caso seja, retorna uma mensagem indicando o mínimo necessário.
    if (value.length < 3) {
      return 'O nome deve ter pelo menos 3 caracteres';
    }

    // Retorna `null` se o nome for válido, indicando que não há erros.
    return null;
  }
}
