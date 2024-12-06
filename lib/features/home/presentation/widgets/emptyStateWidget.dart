// Importa o pacote Flutter para construir a interface do usuário.
import 'package:flutter/material.dart';

// Classe `EmptyStateWidget`.
// Representa um widget genérico para estados vazios, como quando não há dados para exibir.
class EmptyStateWidget extends StatelessWidget {
  // Mensagem que será exibida no estado vazio.
  final String message;

  // Ícone que será exibido acima da mensagem.
  final IconData icon;

  // Construtor da classe `EmptyStateWidget`.
  // Recebe a `message` e o `icon` como parâmetros obrigatórios.
  const EmptyStateWidget({
    super.key,
    required this.message,
    required this.icon,
  });

  // Método `build` que constrói a interface gráfica do widget.
  @override
  Widget build(BuildContext context) {
    return Center(
      // Centraliza o conteúdo no meio da tela.
      child: Column(
        mainAxisAlignment: MainAxisAlignment
            .center, // Alinha os itens no centro verticalmente.
        children: [
          // Ícone que representa o estado vazio.
          Icon(
            icon, // Ícone fornecido como parâmetro.
            size: 80, // Tamanho do ícone.
            color: Colors.grey, // Cor do ícone.
          ),
          const SizedBox(
              height: 20), // Espaçamento vertical entre o ícone e o texto.

          // Mensagem que descreve o estado vazio.
          Text(
            message, // Mensagem fornecida como parâmetro.
            textAlign: TextAlign.center, // Centraliza o texto horizontalmente.
            style: const TextStyle(
              fontSize: 18, // Tamanho da fonte do texto.
              color: Colors.grey, // Cor do texto.
            ),
          ),
        ],
      ),
    );
  }
}
