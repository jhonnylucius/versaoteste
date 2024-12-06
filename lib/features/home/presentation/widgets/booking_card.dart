// Importa o pacote Flutter para construir a interface do usuário.
import 'package:flutter/material.dart';

// Classe `BookingCard`.
// Representa um cartão que exibe as informações de um agendamento.
class BookingCard extends StatelessWidget {
  // Dados do agendamento.
  // O agendamento é representado por um mapa contendo informações dinâmicas.
  final Map<String, dynamic> booking;

  // Callback acionado ao clicar no botão "Detalhes".
  final VoidCallback onViewDetails;

  // Callback acionado ao clicar no botão "Cancelar".
  final VoidCallback onCancel;

  // Construtor da classe `BookingCard`.
  // Recebe os dados do agendamento e os callbacks como parâmetros obrigatórios.
  const BookingCard({
    super.key,
    required this.booking,
    required this.onViewDetails,
    required this.onCancel,
  });

  // Método `build` que constrói a interface gráfica do cartão.
  @override
  Widget build(BuildContext context) {
    return Card(
      // Define margens ao redor do Card.
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      // Define a elevação (sombra) do Card.
      elevation: 4,
      // Define bordas arredondadas para o Card.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      // Adiciona espaçamento interno ao redor do conteúdo do Card.
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alinha os itens à esquerda.
          children: [
            // Nome do serviço agendado.
            Text(
              booking['serviceName'], // Obtém o nome do serviço do mapa.
              style: Theme.of(context)
                  .textTheme
                  .titleLarge, // Estilo do texto baseado no tema.
            ),
            const SizedBox(height: 8), // Espaçamento vertical.

            // Data do agendamento.
            Text(
              'Data: ${booking['date']}', // Exibe a data do agendamento.
              style: Theme.of(context)
                  .textTheme
                  .titleMedium, // Estilo do texto baseado no tema.
            ),
            const SizedBox(height: 4), // Espaçamento vertical.

            // Horário do agendamento.
            Text(
              'Horário: ${booking['time']}', // Exibe o horário do agendamento.
              style: Theme.of(context)
                  .textTheme
                  .titleMedium, // Estilo do texto baseado no tema.
            ),
            const SizedBox(height: 16), // Espaçamento vertical.

            // Botões para ações relacionadas ao agendamento.
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // Espaça os botões igualmente.
              children: [
                // Botão "Cancelar".
                OutlinedButton(
                  onPressed: onCancel, // Chama o callback ao pressionar.
                  child: const Text('Cancelar'), // Texto exibido no botão.
                ),
                // Botão "Detalhes".
                ElevatedButton(
                  onPressed: onViewDetails, // Chama o callback ao pressionar.
                  child: const Text('Detalhes'), // Texto exibido no botão.
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
