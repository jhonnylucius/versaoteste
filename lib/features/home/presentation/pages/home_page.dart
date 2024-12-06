// Importa o pacote Flutter para construir a interface do usuário.
import 'package:flutter/material.dart';
// Importa o widget personalizado `ServiceList`, que exibe uma lista de serviços.
import 'package:versaoteste/features/home/presentation/widgets/service_list.dart';

// Classe `HomePage`.
// Representa a página inicial que exibe uma lista de serviços disponíveis.
class HomePage extends StatelessWidget {
  // Lista de serviços disponíveis.
  // Cada serviço é representado como um mapa contendo informações dinâmicas.
  final List<Map<String, dynamic>> services;

  // Construtor da classe `HomePage`.
  // Recebe a lista de serviços como parâmetro obrigatório.
  const HomePage({super.key, required this.services});

  // Método `build` para construir a interface gráfica da página.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra de aplicativos no topo da página.
      appBar: AppBar(
        title: const Text('Serviços Disponíveis'), // Título exibido na AppBar.
        actions: [
          // Botão de pesquisa na AppBar.
          IconButton(
            icon: const Icon(Icons.search), // Ícone de pesquisa.
            onPressed: () {
              // Ação do botão de pesquisa (a implementar).
            },
          ),
        ],
      ),
      // Corpo da página.
      body: Padding(
        // Adiciona um espaçamento interno ao redor da lista de serviços.
        padding: const EdgeInsets.all(8.0),
        // Widget personalizado que exibe a lista de serviços.
        child: ServiceList(
          services: services, // Passa a lista de serviços para o `ServiceList`.
          onServiceTap: (index) {
            // Obtém o serviço selecionado pelo índice.
            final selectedService = services[index];
            // Navega para a página de detalhes do serviço, passando o serviço como argumento.
            Navigator.pushNamed(
              context,
              '/serviceDetails', // Nome da rota para a página de detalhes.
              arguments: selectedService, // Argumentos passados para a rota.
            );
          },
        ),
      ),
      // Botão flutuante de ação.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navega para a página de adicionar serviço (caso seja um prestador).
          Navigator.pushNamed(context, '/addService');
        },
        child: const Icon(Icons.add), // Ícone do botão flutuante.
      ),
    );
  }
}
