import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart'; // Adicionado import do logger

// Classe `NotificationManager`.
// Gerencia as notificações locais no aplicativo.
class NotificationManager {
  // Instância do plugin de notificações locais.
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Instância do logger para registro de eventos
  final Logger _logger = Logger(); // Adicionado logger

  // Método para inicializar o gerenciador de notificações.
  // Configura as definições iniciais e registra ações de clique.
  Future<void> initialize() async {
    // Configuração para Android.
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings(
            '@mipmap/ic_launcher'); // Ícone do aplicativo (substituir se necessário).

    // Configurações gerais de inicialização para todas as plataformas.
    const InitializationSettings settings =
        InitializationSettings(android: androidSettings);

    // Inicializa o plugin com as configurações e registra o callback para cliques em notificações.
    await _notificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Callback chamado quando o usuário clica na notificação.
        if (kDebugMode) {
          _logger.d(
              'Notification clicked: ${response.payload}'); // Alterado print para logger
        }
      },
    );
  }

  // Método para exibir uma notificação local.
  // Recebe um ID único, título, corpo da mensagem e um payload opcional.
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    // Configurações específicas para Android.
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'default_channel', // ID do canal
      'Default Channel', // Nome do canal
      importance: Importance.high, // Importância alta
      priority: Priority.high, // Prioridade alta
    );

    // Detalhes gerais da notificação (neste caso, apenas Android está configurado).
    const NotificationDetails details =
        NotificationDetails(android: androidDetails);

    // Exibe a notificação com os detalhes fornecidos.
    await _notificationsPlugin.show(
      id, // ID da notificação.
      title, // Título da notificação.
      body, // Corpo/mensagem da notificação.
      details, // Configurações detalhadas da notificação.
    );
  }

  // Método para solicitar permissões de notificação no Android.
  // Retorna um bool indicando se a permissão foi concedida ou não.
  Future<bool> requestNotificationPermissions() async {
    final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
        _notificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    if (androidImplementation == null) {
      _logger
          .w('Implementação Android não disponível'); // Adicionado log de aviso
      return false;
    }

    try {
      final bool? granted =
          await androidImplementation.requestNotificationsPermission();
      return granted ?? false;
    } catch (e) {
      _logger.e('Erro ao solicitar permissão de notificação',
          error: e); // Adicionado log de erro
      return false;
    }
  }
}
