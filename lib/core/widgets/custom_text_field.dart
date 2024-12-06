// Importa o pacote Flutter Material, que contém widgets e classes fundamentais para criar a interface do usuário.
import 'package:flutter/material.dart';

// Declaração da classe `CustomTextField`, um widget customizado para criar campos de texto reutilizáveis.
// Essa classe estende `StatelessWidget`, indicando que não possui estado mutável.
class CustomTextField extends StatelessWidget {
  // Propriedade obrigatória para o texto do placeholder (dica) exibido no campo de texto.
  final String hintText;

  // Propriedade obrigatória que controla o texto digitado no campo.
  // O `TextEditingController` gerencia o valor do campo de texto e permite acessar e modificar o texto diretamente.
  final TextEditingController controller;

  // Propriedade opcional que define se o texto deve ser ocultado (por exemplo, em campos de senha).
  // O valor padrão é `false`, ou seja, o texto não é ocultado.
  final bool obscureText;

  // Propriedade opcional que define o tipo de teclado exibido (por exemplo, numérico, texto, etc.).
  // O valor padrão é `TextInputType.text`, que exibe o teclado padrão para texto.
  final TextInputType keyboardType;

  // Propriedade opcional para uma função de validação.
  // Essa função retorna uma mensagem de erro (`String`) caso a validação falhe, ou `null` se o valor for válido.
  final String? Function(String?)? validator;

  // Construtor da classe, que inicializa as propriedades.
  // Propriedades obrigatórias são marcadas com `required`, enquanto as opcionais têm valores padrão.
  const CustomTextField({
    required this.hintText, // Placeholder obrigatório.
    required this.controller, // Controlador obrigatório.
    this.obscureText = false, // Por padrão, o texto não é ocultado.
    this.keyboardType =
        TextInputType.text, // Por padrão, utiliza teclado de texto.
    this.validator, // Função de validação opcional.
    super.key, // Chave para identificar o widget de forma única.
  });

  // O método `build` é responsável por construir o widget.
  @override
  Widget build(BuildContext context) {
    // Retorna um `TextFormField`, que é um widget de entrada de texto com suporte a validação.
    return TextFormField(
      // Define o controlador do campo, que gerencia o valor digitado.
      controller: controller,

      // Define se o texto deve ser ocultado (por exemplo, para campos de senha).
      obscureText: obscureText,

      // Define o tipo de teclado exibido, como texto, numérico, e-mail, etc.
      keyboardType: keyboardType,

      // Define a função de validação do campo, que será chamada ao submeter um formulário.
      validator: validator,

      // Configura a aparência do campo de texto.
      decoration: InputDecoration(
        // Define o texto de dica (placeholder), exibido quando o campo está vazio.
        hintText: hintText,

        // Define a borda do campo com um contorno arredondado.
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(8.0), // Bordas com raio de 8 pixels.
        ),

        // Define o espaçamento interno do campo, ajustando o conforto visual.
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.0, // Espaçamento horizontal de 16 pixels.
          vertical: 12.0, // Espaçamento vertical de 12 pixels.
        ),
      ),
    );
  }
}
