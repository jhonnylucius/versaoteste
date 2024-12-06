// Importa o pacote Flutter para construir a interface do usuário.
import 'package:flutter/material.dart';

// Classe `SignupPage`.
// Representa a página de registro, permitindo que os usuários criem uma conta.
class SignupPage extends StatelessWidget {
  // Controladores para os campos de texto (nome, email e senha).
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Construtor da classe `SignupPage`.
  SignupPage({super.key});

  // Método privado para registrar um novo usuário.
  // Recebe o `BuildContext` para acessar o contexto da interface.
  void _register(BuildContext context) {
    // Adicionar lógica para registrar o usuário.
    // Exemplo: enviar os dados para uma API ou salvar no Firebase.
  }

  // Método `build` para construir o widget da página de registro.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Estrutura principal da página, incluindo barra de título e corpo.
      appBar: AppBar(
        // Barra de título da página.
        title: Text("Criar Conta"),
      ),
      body: Padding(
        // Espaçamento interno ao redor do corpo da página.
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // Define o alinhamento dos widgets como esticado (preencher a largura).
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Campo de texto para inserir o nome completo do usuário.
            TextField(
              controller:
                  nameController, // Controlador para gerenciar o texto inserido.
              decoration: InputDecoration(
                  labelText: "Nome Completo"), // Rótulo do campo.
            ),
            SizedBox(height: 8.0), // Espaçamento entre os widgets.

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

            // Botão para registrar o usuário.
            ElevatedButton(
              onPressed: () =>
                  _register(context), // Chama o método `_register`.
              child: Text("Registrar"), // Texto exibido no botão.
            ),
          ],
        ),
      ),
    );
  }
}
