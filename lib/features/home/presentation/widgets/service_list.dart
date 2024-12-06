// Importa o pacote Flutter para construir a interface do usuário.
import 'package:flutter/material.dart';

// Importa o widget ServiceCard, que será usado para exibir cada serviço na lista.
import 'service_card.dart';

// Classe `ServiceList`.
// Representa uma lista de serviços, onde cada item é exibido usando o widget `ServiceCard`.
class ServiceList extends StatelessWidget {
  // Lista de serviços a serem exibidos.
  // Cada serviço é representado como um mapa contendo dados como nome, preço e prestador.
  final List<Map<String, dynamic>> services;

  // Callback acionado ao selecionar um serviço.
  // Recebe o índice do serviço selecionado como argumento.
  final void Function(int index) onServiceTap;

  // Construtor da classe `ServiceList`.
  // `services` e `onServiceTap` são parâmetros obrigatórios.
  const ServiceList({
    super.key,
    required this.services,
    required this.onServiceTap,
  });

  // Método `build` para construir a interface do widget.
  @override
  Widget build(BuildContext context) {
    // Verifica se a lista de serviços está vazia.
    if (services.isEmpty) {
      // Retorna uma mensagem centralizada caso não haja serviços na lista.
      return const Center(
        child: Text(
          'Nenhum serviço encontrado.', // Texto exibido.
          style: TextStyle(fontSize: 16.0), // Estilo do texto.
        ),
      );
    }

    // Se houver serviços, retorna uma lista rolável.
    return ListView.builder(
      itemCount: services.length, // Número total de serviços na lista.
      itemBuilder: (context, index) {
        // Obtém o serviço atual pelo índice.
        final service = services[index];

        // Retorna um `ServiceCard` para o serviço atual.
        return ServiceCard(
          service: service, // Mapa contendo os dados do serviço.
          serviceName: service['name'], // Nome do serviço.
          providerName: service['provider'], // Nome do prestador do serviço.
          price: service['price'], // Preço do serviço.
          onTap: () => onServiceTap(index), // Callback ao tocar no cartão.
        );
      },
    );
  }
}
