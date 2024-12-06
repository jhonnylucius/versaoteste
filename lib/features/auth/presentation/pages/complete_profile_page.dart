import 'package:flutter/material.dart';

class CompleteProfilePage extends StatelessWidget {
  final String userType;

  const CompleteProfilePage({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completar Perfil'),
      ),
      body: Center(
        child: Text('Tipo de Usuário: $userType'),
      ),
    );
  }
}
