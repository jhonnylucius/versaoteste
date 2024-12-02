import 'package:flutter/material.dart';

class ProviderDashboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> services;
  final VoidCallback onAddService;

  const ProviderDashboardPage({
    super.key,
    required this.services,
    required this.onAddService,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Painel do Prestador'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAddService,
          ),
        ],
      ),
      body: services.isEmpty
          ? const Center(
              child: Text(
                'Nenhum serviço cadastrado.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    title: Text(service['name']),
                    subtitle: Text('Preço: R\$${service['price']}'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Implementar navegação para detalhes do serviço
                      Navigator.pushNamed(context, '/serviceDetails',
                          arguments: service);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAddService,
        child: const Icon(Icons.add),
      ),
    );
  }
}
