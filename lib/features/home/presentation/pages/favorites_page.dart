import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteProviders;
  final Function(Map<String, dynamic>) onProviderTap;

  const FavoritesPage({
    super.key,
    required this.favoriteProviders,
    required this.onProviderTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: favoriteProviders.isEmpty
          ? const Center(
              child: Text(
                'Você ainda não adicionou nenhum prestador aos favoritos.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: favoriteProviders.length,
              itemBuilder: (context, index) {
                final provider = favoriteProviders[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(provider['photoUrl']),
                      backgroundColor: Colors.grey[300],
                      child: provider['photoUrl'] == null
                          ? Text(provider['name'][0].toUpperCase())
                          : null,
                    ),
                    title: Text(provider['name']),
                    subtitle: Text(provider['category']),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () => onProviderTap(provider),
                  ),
                );
              },
            ),
    );
  }
}
