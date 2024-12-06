// Importa o pacote Flutter Material, que contém classes e widgets essenciais para criar a interface do usuário.
import 'package:flutter/material.dart';
// Importa o arquivo `app_colors.dart`, onde estão definidas as cores principais do tema.
// Isso ajuda a centralizar e organizar as cores da aplicação.
import 'package:versaoteste/core/constants/app_colors.dart';

// Define o tema escuro (`darkTheme`) para o aplicativo, utilizando a classe `ThemeData` do Flutter.
// Essa configuração aplica um estilo escuro em elementos da interface, mantendo consistência visual.
ThemeData darkTheme = ThemeData(
  // Define o nível de brilho do tema como escuro.
  brightness: Brightness.dark,

  // Define a cor principal do tema, que pode ser usada em botões, barras de navegação, etc.
  primaryColor: AppColors.primaryColor,

  // Define a cor de fundo principal para widgets `Scaffold` (estrutura base de telas no Flutter).
  scaffoldBackgroundColor: Colors.black,

  // Configura o tema de texto para o tema escuro.
  // Estilos personalizados de texto são definidos para uso consistente em toda a aplicação.
  textTheme: TextTheme(
    // Estilo de texto grande para exibição (grandes títulos ou destaques).
    displayLarge: TextStyle(
      fontSize: 24, // Define o tamanho da fonte como 24 pixels.
      fontWeight: FontWeight.bold, // Estilo da fonte em negrito (bold).
      color: AppColors
          .backgroundColor, // Cor do texto vinda das constantes de cores.
    ),
    // Estilo de texto para o corpo (textos regulares ou descrições).
    bodyLarge: TextStyle(
      fontSize: 16, // Define o tamanho da fonte como 16 pixels.
      fontWeight:
          FontWeight.normal, // Estilo da fonte como normal (sem negrito).
      color: AppColors
          .backgroundColor, // Cor do texto vinda das constantes de cores.
    ),
  ),

  // Configurações do tema para botões.
  buttonTheme: ButtonThemeData(
    // Define a cor padrão dos botões.
    buttonColor: AppColors.secondaryColor,
    // Define que o texto dos botões segue o tema primário.
    textTheme: ButtonTextTheme.primary,
  ),

  // Configura o esquema de cores do tema.
  // A função `fromSwatch` cria um esquema de cores baseado na cor principal, que aqui é personalizada
  // para incluir uma cor secundária adicional.
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColors.secondaryColor),
);
