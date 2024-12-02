import 'package:flutter/material.dart';

class CompleteProfilePage extends StatelessWidget {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final String userType; // 'client', 'provider', or 'both'

  CompleteProfilePage({super.key, required this.userType});

  void _saveProfile(BuildContext context) {
    // Adicionar lógica para salvar o perfil
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Completar Perfil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: "Endereço"),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: "Telefone"),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              value: userType,
              items: [
                DropdownMenuItem(value: 'client', child: Text("Cliente")),
                DropdownMenuItem(value: 'provider', child: Text("Prestador")),
                DropdownMenuItem(value: 'both', child: Text("Ambos")),
              ],
              onChanged: (value) {
                // Atualizar o tipo de usuário
              },
              decoration: InputDecoration(labelText: "Tipo de Usuário"),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _saveProfile(context),
              child: Text("Salvar Perfil"),
            ),
          ],
        ),
      ),
    );
  }
}
