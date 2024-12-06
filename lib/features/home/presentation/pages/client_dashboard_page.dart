// Importa o pacote Flutter para construir a interface do usuário.
import 'package:flutter/material.dart';

// Classe `ClientDashboardPage`.
// Representa a página do painel do cliente, exibindo os agendamentos ou permitindo explorar serviços.
class ClientDashboardPage extends StatelessWidget {
  // Lista de agendamentos do cliente.
  // Cada agendamento é representado como um mapa com informações como nome do serviço, data e horário.
  final List<Map<String, dynamic>> bookings;

  // Função callback acionada ao explorar serviços.
  final VoidCallback onExploreServices;

  // Construtor da classe `ClientDashboardPage`.
  // Recebe a lista de agendamentos e a função `onExploreServices` como dependências obrigatórias.
  const ClientDashboardPage({
    super.key,
    required this.bookings,
    required this.onExploreServices,
  });

  // Método `build` para construir a interface do usuário.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Estrutura principal da página com uma AppBar.
      appBar: AppBar(
        title: const Text('Painel do Cliente'), // Título da AppBar.
        actions: [
          // Botão de pesquisa para explorar serviços.
          IconButton(
            icon: const Icon(Icons.search), // Ícone do botão.
            onPressed: onExploreServices, // Aciona o callback ao pressionar.
          ),
        ],
      ),
      // Corpo da página.
      body: bookings.isEmpty
          // Exibe uma mensagem quando não há agendamentos.
          ? Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centraliza o conteúdo.
                children: [
                  const Text(
                    'Nenhum agendamento encontrado.', // Mensagem de ausência de agendamentos.
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 16), // Espaçamento vertical.
                  ElevatedButton(
                    onPressed:
                        onExploreServices, // Aciona o callback ao pressionar.
                    child: const Text('Explorar Serviços'), // Texto do botão.
                  ),
                ],
              ),
            )
          // Lista de agendamentos, exibida quando há dados na lista `bookings`.
          : ListView.builder(
              itemCount: bookings.length, // Define o número de itens na lista.
              itemBuilder: (context, index) {
                // Pega o agendamento atual pelo índice.
                final booking = bookings[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0), // Margens do card.
                  child: ListTile(
                    // Título do agendamento (nome do serviço).
                    title: Text(booking['serviceName']),
                    // Subtítulo com a data e o horário do agendamento.
                    subtitle: Text(
                        'Data: ${booking['date']} - Horário: ${booking['time']}'),
                    trailing:
                        const Icon(Icons.arrow_forward), // Ícone à direita.
                    onTap: () {
                      // Implementar navegação para a tela de detalhes do agendamento.
                      Navigator.pushNamed(
                        context,
                        '/bookingDetails', // Nome da rota para os detalhes.
                        arguments:
                            booking, // Passa os dados do agendamento como argumentos.
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
