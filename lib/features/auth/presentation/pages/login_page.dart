// Importa o pacote Flutter para construir a interface do usuário.
import 'package:flutter/material.dart';

// Importa um widget personalizado para botões de login social.
import '../widgets/social_login_buttons.dart';

// Classe `LoginPage`.
// Representa a página de login, permitindo login com email, Google ou Facebook.
class LoginPage extends StatelessWidget {
  // Controladores para os campos de texto (email e senha).
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Construtor da classe `LoginPage`.
  LoginPage({super.key});

  // Método privado para realizar login com email e senha.
  // Recebe o `BuildContext` para acessar o contexto da interface.
  void _loginWithEmail(BuildContext context) {
    // Adicionar lógica para login com email.
    // Exemplo: autenticar o usuário usando uma API ou Firebase.
  }

  // Método privado para realizar login com Google.
  // Recebe o `BuildContext` para acessar o contexto da interface.
  void _loginWithGoogle(BuildContext context) {
    // Adicionar lógica para login com Google.
    // Exemplo: integrar com o Google Sign-In.
  }

  // Método privado para realizar login com Facebook.
  // Recebe o `BuildContext` para acessar o contexto da interface.
  void _loginWithFacebook(BuildContext context) {
    // Adicionar lógica para login com Facebook.
    // Exemplo: integrar com o Facebook Login.
  }

  // Método `build` para construir o widget da página de login.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Estrutura principal da página, incluindo barra de título e corpo.
      appBar: AppBar(
        // Barra de título da página.
        title: Text("Login"),
      ),
      body: Padding(
        // Espaçamento interno ao redor do corpo da página.
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // Define o alinhamento dos widgets como esticado (preencher a largura).
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Campo de texto para inserir o email do usuário.
            TextField(
              controller:
                  emailController, // Controlador para gerenciar o texto inserido.
              decoration:
                  InputDecoration(labelText: "Email"), // Rótulo do campo.
            ),
            SizedBox(height: 8.0), // Espaçamento entre os widgets.

            // Campo de texto para inserir a senha do usuário.
            TextField(
              controller:
                  passwordController, // Controlador para gerenciar o texto inserido.
              decoration:
                  InputDecoration(labelText: "Senha"), // Rótulo do campo.
              obscureText: true, // Oculta o texto (usado para campos de senha).
            ),
            SizedBox(height: 16.0), // Espaçamento entre os widgets.

            // Botão para realizar login com email e senha.
            ElevatedButton(
              onPressed: () =>
                  _loginWithEmail(context), // Chama o método `_loginWithEmail`.
              child: Text("Login com Email"), // Texto exibido no botão.
            ),
            SizedBox(height: 16.0), // Espaçamento entre os widgets.

            // Botões de login social (Google e Facebook).
            // Usam um widget personalizado `SocialLoginButtons`.
            SocialLoginButtons(
              onGooglePressed: () => _loginWithGoogle(
                  context), // Chama o método `_loginWithGoogle`.
              onFacebookPressed: () => _loginWithFacebook(
                  context), // Chama o método `_loginWithFacebook`.
            ),
          ],
        ),
      ),
    );
  }
}
