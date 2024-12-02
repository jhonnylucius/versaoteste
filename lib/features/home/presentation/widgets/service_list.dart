import 'package:flutter/material.dart';

import 'service_card.dart';

class ServiceList extends StatelessWidget {
  final List<Map<String, dynamic>> services;
  final Function(Map<String, dynamic>) onServiceTap;

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
          'Nenhum serviço disponível no momento.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return ServiceCard(
          serviceName: service['serviceName'],
          providerName: service['providerName'],
          price: service['price'],
          onTap: () => onServiceTap(service),
        );
      },
    );
  }
}
