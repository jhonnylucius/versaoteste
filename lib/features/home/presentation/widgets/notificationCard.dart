// Importa o pacote Flutter para construir a interface do usuário.
import 'package:flutter/material.dart';

// Classe `NotificationCard`.
// Representa um cartão de notificação que exibe título, mensagem e data.
class NotificationCard extends StatelessWidget {
  // Título da notificação.
  final String title;

  // Mensagem da notificação.
  final String message;

  // Data e hora da notificação.
  final DateTime date;

  // Callback acionado quando o cartão é tocado (opcional).
  final VoidCallback? onTap;

  // Construtor da classe `NotificationCard`.
  // Recebe `title`, `message`, `date` como obrigatórios e `onTap` como opcional.
  const NotificationCard({
    super.key,
    required this.title,
    required this.message,
    required this.date,
    this.onTap,
  });

  // Método `build` que constrói a interface gráfica do cartão.
  @override
  Widget build(BuildContext context) {
    return Card(
      // Define margens ao redor do Card.
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      // Usa `InkWell` para adicionar um efeito de toque.
      child: InkWell(
        onTap: onTap, // Chama o callback `onTap` se for fornecido.
        child: Padding(
          // Adiciona espaçamento interno ao redor do conteúdo do Card.
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Alinha os itens à esquerda.
            children: [
              // Título da notificação.
              Text(
                title, // Exibe o título fornecido.
                style: Theme.of(context)
                    .textTheme
                    .titleLarge, // Estilo do texto baseado no tema.
              ),
              const SizedBox(height: 8.0), // Espaçamento vertical.

              // Mensagem da notificação.
              Text(
                message, // Exibe a mensagem fornecida.
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium, // Estilo do texto baseado no tema.
              ),
              const SizedBox(height: 8.0), // Espaçamento vertical.

              // Data e hora formatadas.
              Text(
                _formatDate(date), // Formata a data para exibição.
                style: Theme.of(context)
                    .textTheme
                    .bodySmall, // Estilo do texto baseado no tema.
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para formatar a data e hora em um formato legível.
  String _formatDate(DateTime date) {
    // Formata como "dd/MM/yyyy HH:mm", garantindo que os minutos tenham dois dígitos.
    return "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}";
  }
}
