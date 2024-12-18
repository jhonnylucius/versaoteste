// Declaração da classe `AppConstants`, usada para armazenar constantes da aplicação.
// As constantes ajudam a centralizar valores que são reutilizados em diferentes partes do código,
// tornando-o mais organizado e fácil de manter.
class AppConstants {
  // Declaração de uma constante estática para o nome do aplicativo.
  // O modificador `static` indica que a constante pertence à classe em si e não a instâncias específicas.
  // O modificador `const` indica que o valor é imutável e conhecido em tempo de compilação.
  static const String appName = 'AgendaPro';

  // Declaração de uma constante estática para a URL base da API.
  // Essa constante facilita a manutenção do código, pois, se a URL da API mudar,
  // é necessário alterá-la apenas aqui.
  static const String apiUrl = 'https://api.agendapro.com/v1';

  // Declaração de uma constante estática para o tempo limite (timeout) em requisições.
  // O valor é definido em segundos e é utilizado para configurar o tempo máximo
  // que a aplicação aguardará por uma resposta de uma requisição antes de considerar uma falha.
  static const int timeoutDuration = 30; // em segundos

  // Agrupamento de mensagens padrão, utilizadas para feedback ao usuário em diferentes cenários.

  static const Duration cacheValidityDuration = Duration(hours: 1);

  // Essas mensagens ajudam a centralizar os textos, facilitando alterações futuras
  // e permitindo uma consistência maior na comunicação com o usuário.
  static const Duration apiTimeout = Duration(seconds: 30);
  // Mensagem genérica de erro. É exibida ao usuário quando ocorre um problema
  // que não pode ser identificado de forma mais específica.
  static const String genericErrorMessage =
      'Ocorreu um erro. Tente novamente mais tarde.';

  // Mensagem de erro de rede. Usada para alertar o usuário sobre a ausência de conexão com a internet.
  // Isso é útil para evitar confusões quando a aplicação não consegue acessar a API.
  static const String networkErrorMessage =
      'Verifique sua conexão com a internet.';
}
