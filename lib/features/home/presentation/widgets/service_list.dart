import 'package:flutter/material.dart';

import 'service_card.dart';

class ServiceList extends StatelessWidget {
  final List<Map<String, dynamic>> services;
  final void Function(int index) onServiceTap;

  const ServiceList({
    super.key,
    required this.services,
    required this.onServiceTap,
  });

  @override
  Widget build(BuildContext context) {
    if (services.isEmpty) {
      return const Center(
        child: Text(
          'Nenhum serviço encontrado.',
          style: TextStyle(fontSize: 16.0),
        ),
      );
    }

    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return ServiceCard(
          service: service,
          serviceName: service['name'],
          providerName: service['provider'],
          price: service['price'],
          onTap: () => onServiceTap(index),
        );
      },
    );
  }
}
