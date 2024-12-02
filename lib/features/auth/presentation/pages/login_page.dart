import 'package:flutter/material.dart';

import '../widgets/social_login_buttons.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

  void _loginWithEmail(BuildContext context) {
    // Adicionar lógica para login com email
  }

  void _loginWithGoogle(BuildContext context) {
    // Adicionar lógica para login com Google
  }

  void _loginWithFacebook(BuildContext context) {
    // Adicionar lógica para login com Facebook
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Senha"),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _loginWithEmail(context),
              child: Text("Login com Email"),
            ),
            SizedBox(height: 16.0),
            SocialLoginButtons(
              onGooglePressed: () => _loginWithGoogle(context),
              onFacebookPressed: () => _loginWithFacebook(context),
            ),
          ],
        ),
      ),
    );
  }
}
