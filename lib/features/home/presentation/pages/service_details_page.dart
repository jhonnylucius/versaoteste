import 'package:flutter/material.dart';

class ServiceDetailsPage extends StatelessWidget {
  final String serviceName;
  final String providerName;
  final double price;
  final String description;
  final VoidCallback onBookService;

  const ServiceDetailsPage({
    super.key,
    required this.serviceName,
    required this.providerName,
    required this.price,
    required this.description,
    required this.onBookService,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Serviço'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              serviceName,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Prestador: $providerName',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Preço: R\$${price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Descrição:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: onBookService,
              child: const Text('Agendar Serviço'),
            ),
          ],
        ),
      ),
    );
  }
}
