// Importa o pacote Flutter para inicialização.
import 'package:flutter/material.dart';

// Importa arquivos de navegação.
import 'navigation/app_router.dart';
import 'navigation/navigation_service.dart';

void main() {
  runApp(const MyApp());
}

// Widget principal do aplicativo.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgendaPro', // Título do aplicativo.
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey:
          NavigationService.navigatorKey, // Configura navegação global.
      onGenerateRoute: AppRouter.generateRoute, // Define como gerar as rotas.
      initialRoute: '/login', // Define a rota inicial como login.
    );
  }
}
