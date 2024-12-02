import 'package:flutter/material.dart';

import '../domain/usecases/login_with_email.dart';
import '../domain/usecases/login_with_facebook.dart';
import '../domain/usecases/login_with_google.dart';
import 'widgets/social_login_buttons.dart';

class LoginPage extends StatelessWidget {
  final LoginWithEmail loginWithEmail;
  final LoginWithGoogle loginWithGoogle;
  final LoginWithFacebook loginWithFacebook;

  const LoginPage({
    super.key,
    required this.loginWithEmail,
    required this.loginWithGoogle,
    required this.loginWithFacebook,
  });

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
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
                  await loginWithEmail(
                    emailController.text,
                    passwordController.text,
                  );
                  // Navegar para a próxima tela
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Erro ao fazer login: \$e")),
                  );
                }
              },
              child: const Text("Entrar com Email e Senha"),
            ),
            const SizedBox(height: 16),
            SocialLoginButtons(
              loginWithGoogle: loginWithGoogle,
              loginWithFacebook: loginWithFacebook,
            ),
          ],
        ),
      ),
    );
  }
}
