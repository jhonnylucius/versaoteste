// Importa o pacote Flutter Local Notifications para gerenciar notificações locais.
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Classe `NotificationManager`.
// Gerencia as notificações locais no aplicativo.
class NotificationManager {
  // Instância do plugin de notificações locais.
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

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
          print('Notification clicked: ${response.payload}');
        }
      },
    );
  }

  // Método para exibir uma notificação local.
  // Requer `id` (identificador da notificação), `title` (título) e `body` (mensagem).
  Future<void> showNotification({
    required int id, // Identificador único para a notificação.
    required String title, // Título da notificação.
    required String body, // Corpo/mensagem da notificação.
  }) async {
    // Configuração para notificações no Android.
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'default_channel', // ID do canal de notificações (deve ser único por canal).
      'Default Channel', // Nome do canal exibido nas configurações do dispositivo.
      importance: Importance.max, // Define a importância como máxima.
      priority: Priority.high, // Define a prioridade como alta.
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
}
