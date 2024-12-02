import 'package:flutter/material.dart';

class CompleteProfilePage extends StatelessWidget {
  const CompleteProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final addressController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Completar Perfil")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nome Completo"),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: "Telefone"),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: "Endereço"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Salvar informações do perfil no banco de dados ou backend
              },
              child: const Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
