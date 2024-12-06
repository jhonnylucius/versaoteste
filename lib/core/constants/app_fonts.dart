// Importa o pacote Flutter Material, que fornece widgets e classes fundamentais
// para a construção da interface do usuário no Flutter.
import 'package:flutter/material.dart';

// Declaração da classe `AppFonts`, usada para centralizar as configurações de fontes e estilos de texto
// utilizados na aplicação. Isso facilita a manutenção e garante consistência visual.
class AppFonts {
  // Declaração de uma constante estática que define a fonte primária do aplicativo.
  // `primaryFont` será usada principalmente em títulos e elementos de destaque.
  static const String primaryFont = 'Roboto';

  // Declaração de uma constante estática que define a fonte secundária do aplicativo.
  // `secondaryFont` será usada em textos menos destacados ou no corpo do conteúdo.
  static const String secondaryFont = 'Montserrat';

  // Declaração de uma constante estática para o estilo de texto principal `headline1`.
  // Esse estilo é utilizado em títulos importantes e destacados no aplicativo.
  static const TextStyle headline1 = TextStyle(
    fontFamily: primaryFont, // Define que o estilo usará a fonte primária.
    fontSize: 24, // Tamanho da fonte em pixels. Ideal para títulos.
    fontWeight:
        FontWeight.bold, // Define o peso da fonte como "negrito" (bold).
    color: Colors.black, // Define a cor do texto como preto.
  );

  // Declaração de uma constante estática para o estilo de texto do corpo do aplicativo `bodyText`.
  // Esse estilo é utilizado para textos menos destacados, como descrições ou conteúdo textual.
  static const TextStyle bodyText = TextStyle(
    fontFamily: secondaryFont, // Define que o estilo usará a fonte secundária.
    fontSize: 16, // Tamanho da fonte em pixels. Ideal para textos de corpo.
    fontWeight: FontWeight.normal, // Define o peso da fonte como "normal".
    color: Colors
        .black54, // Define a cor do texto como preto com opacidade (preto acinzentado).
  );
}
