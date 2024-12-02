import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String serviceName;
  final String providerName;
  final double price;
  final VoidCallback onTap;

  const ServiceCard({
    Key? key,
    required this.serviceName,
    required this.providerName,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      serviceName,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Prestador: $providerName',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Preço: R\$${price.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16.0,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
