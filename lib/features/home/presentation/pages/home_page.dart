import 'package:flutter/material.dart';
import 'package:versaoteste/features/home/presentation/widgets/service_list.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> services;

  const HomePage({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serviços Disponíveis'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implementar busca de serviços
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ServiceList(
          services: services,
          onServiceTap: (index) {
            final selectedService = services[index];
            Navigator.pushNamed(
              context,
              '/serviceDetails',
              arguments: selectedService,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar para adicionar novo serviço (caso seja um prestador)
          Navigator.pushNamed(context, '/addService');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
