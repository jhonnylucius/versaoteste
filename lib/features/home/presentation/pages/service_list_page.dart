import 'package:flutter/material.dart';

class ServiceListPage extends StatelessWidget {
  final List<Map<String, dynamic>> services;
  final Function(Map<String, dynamic>) onServiceTap;

  const ServiceListPage({
    super.key,
    required this.services,
    required this.onServiceTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Serviços'),
      ),
      body: services.isEmpty
          ? const Center(
              child: Text(
                'Nenhum serviço disponível.',
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
                    leading: const Icon(Icons.work_outline),
                    title: Text(service['name']),
                    subtitle: Text('Preço: R\$${service['price']}'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () => onServiceTap(service),
                  ),
                );
              },
            ),
    );
  }
}
