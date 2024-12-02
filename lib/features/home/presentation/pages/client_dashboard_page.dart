import 'package:flutter/material.dart';

class ClientDashboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> bookings;
  final VoidCallback onExploreServices;

  const ClientDashboardPage({
    super.key,
    required this.bookings,
    required this.onExploreServices,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Painel do Cliente'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: onExploreServices,
          ),
        ],
      ),
      body: bookings.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Nenhum agendamento encontrado.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: onExploreServices,
                    child: const Text('Explorar Serviços'),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    title: Text(booking['serviceName']),
                    subtitle: Text(
                        'Data: ${booking['date']} - Horário: ${booking['time']}'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Implementar navegação para detalhes do agendamento
                      Navigator.pushNamed(context, '/bookingDetails',
                          arguments: booking);
                    },
                  ),
                );
              },
            ),
    );
  }
}
