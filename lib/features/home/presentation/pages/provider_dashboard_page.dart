// Importa o pacote Flutter para criar a interface do usuário.
import 'package:flutter/material.dart';

// Classe `ProviderDashboardPage`.
// Representa o painel do prestador, exibindo os serviços cadastrados.
class ProviderDashboardPage extends StatelessWidget {
  // Lista de serviços cadastrados pelo prestador.
  // Cada serviço é representado como um mapa contendo informações dinâmicas.
  final List<Map<String, dynamic>> services;

  // Função callback acionada para adicionar um novo serviço.
  final VoidCallback onAddService;

  // Construtor da classe `ProviderDashboardPage`.
  // Recebe a lista de serviços e a função `onAddService` como parâmetros obrigatórios.
  const ProviderDashboardPage({
    super.key,
    required this.services,
    required this.onAddService,
  });

  // Método `build` que constrói a interface gráfica da página.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra de aplicativos no topo da página.
      appBar: AppBar(
        title: const Text('Painel do Prestador'), // Título exibido na AppBar.
        actions: [
          // Botão na AppBar para adicionar um novo serviço.
          IconButton(
            icon: const Icon(Icons.add), // Ícone do botão.
            onPressed: onAddService, // Chama o callback ao pressionar.
          ),
        ],
      ),
      // Corpo da página.
      body: services.isEmpty
          // Caso não haja serviços cadastrados, exibe uma mensagem centralizada.
          ? const Center(
              child: Text(
                'Nenhum serviço cadastrado.', // Mensagem informativa.
                style: TextStyle(
                    fontSize: 16, color: Colors.grey), // Estilo do texto.
              ),
            )
          // Caso haja serviços cadastrados, exibe uma lista.
          : ListView.builder(
              itemCount: services.length, // Número de serviços na lista.
              itemBuilder: (context, index) {
                // Obtém o serviço atual pelo índice.
                final service = services[index];
                return Card(
                  // Margens ao redor do Card.
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    // Nome do serviço como título.
                    title: Text(service['name']),
                    // Preço do serviço como subtítulo.
                    subtitle: Text('Preço: R\$${service['price']}'),
                    // Ícone à direita do ListTile.
                    trailing: const Icon(Icons.arrow_forward),
                    // Navegação para detalhes do serviço ao tocar no ListTile.
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/serviceDetails', // Nome da rota para detalhes do serviço.
                        arguments:
                            service, // Passa os dados do serviço como argumentos.
                      );
                    },
                  ),
                );
              },
            ),
      // Botão flutuante para adicionar um novo serviço.
      floatingActionButton: FloatingActionButton(
        onPressed: onAddService, // Chama o callback ao pressionar.
        child: const Icon(Icons.add), // Ícone do botão.
      ),
    );
  }
}
