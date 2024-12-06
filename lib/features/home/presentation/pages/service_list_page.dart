// Importa o pacote Flutter para construir a interface do usuário.
import 'package:flutter/material.dart';

// Classe `ServiceListPage`.
// Representa uma página que exibe uma lista de serviços disponíveis.
class ServiceListPage extends StatelessWidget {
  // Lista de serviços disponíveis.
  // Cada serviço é representado como um mapa contendo informações dinâmicas.
  final List<Map<String, dynamic>> services;

  // Função callback acionada quando um serviço é selecionado.
  // Recebe o mapa do serviço como argumento.
  final Function(Map<String, dynamic>) onServiceTap;

  // Construtor da classe `ServiceListPage`.
  // Recebe a lista de serviços e a função `onServiceTap` como parâmetros obrigatórios.
  const ServiceListPage({
    super.key,
    required this.services,
    required this.onServiceTap,
  });

  // Método `build` que constrói a interface gráfica da página.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra de aplicativos no topo da página.
      appBar: AppBar(
        title: const Text('Lista de Serviços'), // Título exibido na AppBar.
      ),
      // Corpo da página.
      body: services.isEmpty
          // Caso não haja serviços disponíveis, exibe uma mensagem centralizada.
          ? const Center(
              child: Text(
                'Nenhum serviço disponível.', // Mensagem informativa.
                style: TextStyle(
                    fontSize: 16, color: Colors.grey), // Estilo do texto.
              ),
            )
          // Caso haja serviços disponíveis, exibe uma lista.
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
                    leading:
                        const Icon(Icons.work_outline), // Ícone do serviço.
                    title: Text(service['name']), // Nome do serviço.
                    subtitle: Text(
                        'Preço: R\$${service['price']}'), // Preço do serviço.
                    trailing: const Icon(
                        Icons.arrow_forward), // Ícone de seta à direita.
                    // Função chamada ao tocar no serviço.
                    onTap: () => onServiceTap(service),
                  ),
                );
              },
            ),
    );
  }
}
