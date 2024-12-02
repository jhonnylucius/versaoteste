import 'package:flutter/material.dart';

import '../domain/usecases/register_user.dart';

class SignupPage extends StatelessWidget {
  final RegisterUser registerUser;

  const SignupPage({
    super.key,
    required this.registerUser,
  });

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Registrar")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Senha"),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                try {
                  await registerUser(
                    emailController.text,
                    passwordController.text,
                  );
                  // Navegar para a próxima tela
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Erro ao registrar: \$e")),
                  );
                }
              },
              child: const Text("Registrar"),
            ),
          ],
        ),
      ),
    );
  }
}
