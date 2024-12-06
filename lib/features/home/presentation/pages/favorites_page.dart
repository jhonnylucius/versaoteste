// Importa o pacote Flutter para criar a interface do usuário.
import 'package:flutter/material.dart';

// Classe `FavoritesPage`.
// Representa a página que exibe a lista de prestadores favoritos do usuário.
class FavoritesPage extends StatelessWidget {
  // Lista de prestadores favoritos.
  // Cada prestador é representado por um mapa com chaves String e valores dinâmicos.
  final List<Map<String, dynamic>> favoriteProviders;

  // Função callback que é chamada quando um prestador é selecionado.
  // Recebe um mapa representando o prestador selecionado.
  final Function(Map<String, dynamic>) onProviderTap;

  // Construtor da classe `FavoritesPage`.
  // Recebe a lista de favoritos e a função de callback como parâmetros obrigatórios.
  const FavoritesPage({
    super.key,
    required this.favoriteProviders,
    required this.onProviderTap,
  });

  // Método `build` que constrói a interface gráfica da página.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra de aplicativos no topo da tela.
      appBar: AppBar(
        title: const Text('Favoritos'), // Título exibido na AppBar.
      ),
      // Corpo da página.
      body: favoriteProviders.isEmpty
          // Se a lista de favoritos estiver vazia, exibe uma mensagem centralizada.
          ? const Center(
              child: Text(
                'Você ainda não adicionou nenhum prestador aos favoritos.', // Mensagem informativa.
                style: TextStyle(
                    fontSize: 16, color: Colors.grey), // Estilo do texto.
              ),
            )
          // Se houver prestadores favoritos, exibe uma lista.
          : ListView.builder(
              itemCount: favoriteProviders.length, // Número de itens na lista.
              itemBuilder: (context, index) {
                // Obtém o prestador atual da lista.
                final provider = favoriteProviders[index];
                return Card(
                  // Margens ao redor do Card.
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    // Ícone à esquerda, geralmente uma imagem circular.
                    leading: CircleAvatar(
                      // Imagem de fundo obtida da URL da foto do prestador.
                      backgroundImage: NetworkImage(provider['photoUrl']),
                      backgroundColor: Colors
                          .grey[300], // Cor de fundo se a imagem não carregar.
                      // Se não houver 'photoUrl', exibe a primeira letra do nome.
                      child: provider['photoUrl'] == null
                          ? Text(provider['name'][0].toUpperCase())
                          : null,
                    ),
                    // Título do ListTile, nome do prestador.
                    title: Text(provider['name']),
                    // Subtítulo, categoria do prestador.
                    subtitle: Text(provider['category']),
                    // Ícone à direita do ListTile.
                    trailing: const Icon(Icons.arrow_forward),
                    // Função chamada ao tocar no ListTile.
                    onTap: () => onProviderTap(provider),
                  ),
                );
              },
            ),
    );
  }
}
