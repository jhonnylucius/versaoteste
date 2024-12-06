// Importa o pacote Flutter para construir a interface do usuário.
import 'package:flutter/material.dart';

// Classe `SocialLoginButtons`.
// Representa um conjunto de botões para login social, incluindo Google e Facebook.
class SocialLoginButtons extends StatelessWidget {
  // Callback para o evento de clique no botão de login com Google.
  final VoidCallback onGooglePressed;

  // Callback para o evento de clique no botão de login com Facebook.
  final VoidCallback onFacebookPressed;

  // Construtor da classe `SocialLoginButtons`.
  // Recebe os callbacks para os eventos de clique nos botões como parâmetros obrigatórios.
  const SocialLoginButtons({
    super.key,
    required this.onGooglePressed, // Callback para o botão Google.
    required this.onFacebookPressed, // Callback para o botão Facebook.
  });

  // Método `build` para construir o widget.
  @override
  Widget build(BuildContext context) {
    return Row(
      // Define o alinhamento dos botões como espaçados igualmente.
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Botão para login com Google.
        ElevatedButton.icon(
          onPressed: onGooglePressed, // Callback acionado ao clicar no botão.
          icon: Icon(Icons.g_mobiledata), // Ícone do botão (Google).
          label: Text("Google"), // Texto exibido no botão.
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // Cor de fundo do botão.
          ),
        ),
        // Botão para login com Facebook.
        ElevatedButton.icon(
          onPressed: onFacebookPressed, // Callback acionado ao clicar no botão.
          icon: Icon(Icons.facebook), // Ícone do botão (Facebook).
          label: Text("Facebook"), // Texto exibido no botão.
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Cor de fundo do botão.
          ),
        ),
      ],
    );
  }
}
