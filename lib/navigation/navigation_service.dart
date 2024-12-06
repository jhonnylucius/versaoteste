// Importa o pacote Flutter para gerenciamento de navegação.
import 'package:flutter/material.dart';

// Serviço de navegação global.
class NavigationService {
  // Define a chave global usada para acessar o estado do navegador.
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// Método para navegar para uma rota específica.
  static Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  /// Método para voltar à página anterior.
  static void goBack() {
    navigatorKey.currentState!.pop();
  }
}
