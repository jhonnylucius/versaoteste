// Importa o pacote Flutter Material, que contém widgets e classes fundamentais
// para a construção de interfaces do Flutter.
import 'package:flutter/material.dart';

// Declaração da classe `CustomButton`, que é um widget customizado para criar botões estilizados.
// `CustomButton` estende `StatelessWidget`, o que significa que ele não tem estado mutável.
class CustomButton extends StatelessWidget {
  // Propriedade obrigatória que define o texto a ser exibido no botão.
  final String text;

  // Propriedade obrigatória que define a função a ser executada quando o botão é pressionado.
  final VoidCallback onPressed;

  // Propriedade opcional que define a cor de fundo do botão. Por padrão, é azul.
  final Color color;

  // Propriedade opcional que define a cor do texto dentro do botão. Por padrão, é branco.
  final Color textColor;

  // Construtor da classe, que inicializa as propriedades.
  // O uso de `required` indica que as propriedades `text` e `onPressed` são obrigatórias.
  // As propriedades `color` e `textColor` têm valores padrão, portanto, são opcionais.
  const CustomButton({
    required this.text, // O texto do botão é obrigatório.
    required this.onPressed, // A ação ao pressionar o botão é obrigatória.
    this.color = Colors.blue, // Valor padrão para a cor de fundo.
    this.textColor = Colors.white, // Valor padrão para a cor do texto.
    super.key, // Passa a chave para o construtor pai, `StatelessWidget`.
  });

  // O método `build` é responsável por construir o widget.
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // Estilo do botão é definido com `styleFrom` para personalizar a aparência.
      style: ElevatedButton.styleFrom(
        // Define a cor do texto do botão.
        foregroundColor: textColor,
        // Define a cor de fundo do botão.
        backgroundColor: color,
        // Define o espaçamento interno do botão (padding).
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        // Define o estilo do texto dentro do botão.
        textStyle: TextStyle(
          fontSize: 16.0, // Tamanho da fonte do texto.
          fontWeight: FontWeight.bold, // Peso da fonte definido como negrito.
        ),
      ),
      // Define a função que será executada quando o botão for pressionado.
      onPressed: onPressed,
      // Define o texto exibido no botão, utilizando o valor da propriedade `text`.
      child: Text(text),
    );
  }
}
