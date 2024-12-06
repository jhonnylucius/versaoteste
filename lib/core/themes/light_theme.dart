// Importa o pacote Flutter Material, que fornece widgets e classes fundamentais
// para a construção da interface do usuário no Flutter.
import 'package:flutter/material.dart';
// Importa o arquivo `app_colors.dart`, onde estão definidas as cores principais do tema.
// Centralizar as cores em um arquivo separado facilita a manutenção e a reutilização das mesmas.
import 'package:versaoteste/core/constants/app_colors.dart';

// Define o tema claro (`lightTheme`) para o aplicativo, utilizando a classe `ThemeData`.
// Essa configuração aplica um estilo claro nos elementos da interface, garantindo consistência visual.
ThemeData lightTheme = ThemeData(
  // Define o nível de brilho do tema como claro.
  brightness: Brightness.light,

  // Define a cor principal do tema, usada em componentes como AppBar, botões e destaque geral.
  primaryColor: AppColors.primaryColor,

  // Define a cor de fundo padrão para widgets `Scaffold` (estrutura base de telas no Flutter).
  scaffoldBackgroundColor: AppColors.backgroundColor,

  // Configura o tema de texto para o tema claro.
  // Estilos personalizados de texto são definidos para uso consistente em toda a aplicação.
  textTheme: TextTheme(
    // Estilo de texto grande para exibição (grandes títulos ou destaques).
    displayLarge: TextStyle(
      fontSize: 24, // Define o tamanho da fonte como 24 pixels.
      fontWeight: FontWeight.bold, // Estilo da fonte em negrito (bold).
      color: AppColors.textColor, // Cor do texto vinda das constantes de cores.
    ),
    // Estilo de texto para o corpo (textos regulares ou descrições).
    bodyLarge: TextStyle(
      fontSize: 16, // Define o tamanho da fonte como 16 pixels.
      fontWeight:
          FontWeight.normal, // Estilo da fonte como normal (sem negrito).
      color: AppColors.textColor, // Cor do texto vinda das constantes de cores.
    ),
  ),

  // Configurações do tema para botões.
  buttonTheme: ButtonThemeData(
    // Define a cor padrão dos botões.
    buttonColor: AppColors.primaryColor,
    // Define que o texto dos botões segue o tema primário.
    textTheme: ButtonTextTheme.primary,
  ),

  // Configura o esquema de cores do tema.
  // A função `fromSwatch` cria um esquema de cores baseado na cor principal, que aqui é personalizada
  // para incluir uma cor secundária adicional.
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColors.secondaryColor),
);
