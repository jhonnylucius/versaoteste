// Importa o pacote Flutter para construir a interface do usuário.
import 'package:flutter/material.dart';

// Classe `ReviewServicePage`.
// Representa uma página onde o usuário pode avaliar um serviço.
class ReviewServicePage extends StatefulWidget {
  // Dados do serviço a ser avaliado.
  // O serviço é representado por um mapa contendo informações dinâmicas.
  final Map<String, dynamic> service;

  // Construtor da classe `ReviewServicePage`.
  // O `service` é um parâmetro obrigatório.
  const ReviewServicePage({super.key, required this.service});

  @override
  State<ReviewServicePage> createState() => _ReviewServicePageState();
}

// Classe privada `_ReviewServicePageState`.
// Gerencia o estado da página e manipula as interações do usuário.
class _ReviewServicePageState extends State<ReviewServicePage> {
  // Controlador para capturar o texto do campo de comentário.
  final TextEditingController _reviewController = TextEditingController();

  // Variável para armazenar a avaliação selecionada pelo usuário (de 1 a 5).
  double _rating = 0;

  // Método `dispose` para liberar recursos quando a página for descartada.
  @override
  void dispose() {
    _reviewController.dispose(); // Libera o controlador do comentário.
    super.dispose();
  }

  // Método `_submitReview` para processar a avaliação do usuário.
  void _submitReview() {
    // Verifica se uma avaliação foi selecionada.
    if (_rating == 0) {
      // Exibe uma mensagem de erro se nenhuma avaliação foi feita.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecione uma avaliação.')),
      );
      return;
    }

    // Cria um mapa com os dados da avaliação.
    final reviewData = {
      'serviceId': widget.service['id'], // ID do serviço avaliado.
      'rating': _rating, // Nota da avaliação (1 a 5).
      'comment': _reviewController.text, // Comentário opcional.
    };

    // Retorna os dados da avaliação para a página anterior.
    Navigator.pop(context, reviewData);
  }

  // Método `build` para construir a interface gráfica da página.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra de aplicativos no topo da página.
      appBar: AppBar(
        // Título da página, mostrando o nome do serviço avaliado.
        title: Text('Avaliar ${widget.service['name']}'),
      ),
      // Corpo da página.
      body: Padding(
        padding: const EdgeInsets.all(
            16.0), // Espaçamento interno ao redor do conteúdo.
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alinha os itens à esquerda.
          children: [
            // Texto de cabeçalho para a seção de avaliação.
            Text(
              'Avaliação do Serviço',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge, // Estilo do texto baseado no tema.
            ),
            const SizedBox(height: 16), // Espaçamento vertical.

            // Seção de estrelas para avaliar o serviço.
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Centraliza as estrelas horizontalmente.
              children: List.generate(5, (index) {
                // Gera 5 botões de estrela.
                return IconButton(
                  onPressed: () {
                    // Define a avaliação selecionada com base no índice da estrela.
                    setState(() {
                      _rating = index + 1.0;
                    });
                  },
                  icon: Icon(
                    Icons.star, // Ícone de estrela.
                    color: index < _rating
                        ? Colors.amber
                        : Colors.grey, // Cor varia com a avaliação.
                  ),
                );
              }),
            ),
            const SizedBox(height: 16), // Espaçamento vertical.

            // Campo de texto para o usuário deixar um comentário.
            TextField(
              controller: _reviewController, // Controlador do campo.
              maxLines: 5, // Define o número máximo de linhas do texto.
              decoration: const InputDecoration(
                labelText: 'Deixe seu comentário', // Rótulo do campo.
                border: OutlineInputBorder(), // Borda ao redor do campo.
              ),
            ),
            const Spacer(), // Adiciona um espaço flexível, empurrando o botão para o rodapé.

            // Botão para enviar a avaliação.
            ElevatedButton(
              onPressed:
                  _submitReview, // Chama o método `_submitReview` ao pressionar.
              child: const Text('Enviar Avaliação'), // Texto do botão.
            ),
          ],
        ),
      ),
    );
  }
}
