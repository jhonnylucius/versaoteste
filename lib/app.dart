// Importa o pacote Flutter para construção de interfaces de usuário.
import 'package:flutter/material.dart';

// Importa o roteador de navegação do aplicativo.
import 'navigation/app_router.dart';
// Importa o serviço de navegação que gerencia o estado do navegador.
import 'navigation/navigation_service.dart';

// Classe principal do aplicativo `App`.
class App extends StatelessWidget {
  // Construtor padrão.
  const App({super.key});

  // Método `build` que constrói a interface principal do aplicativo.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título do aplicativo (exibido no gerenciador de tarefas, por exemplo).
      title: 'AgendaPro',

      // Define o tema claro padrão do aplicativo.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Paleta de cores primária.
        visualDensity: VisualDensity
            .adaptivePlatformDensity, // Adaptação da densidade visual para diferentes plataformas.
      ),

      // Define o tema escuro alternativo do aplicativo.
      darkTheme:
          ThemeData.dark(), // Tema escuro baseado na configuração padrão.

      // Define a chave global de navegação, usada pelo serviço de navegação.
      navigatorKey: NavigationService.navigatorKey,

      // Define o método para geração de rotas do aplicativo.
      onGenerateRoute: AppRouter.generateRoute,

      // Define a rota inicial ao iniciar o aplicativo.
      initialRoute: '/login', // Padrão configurado para a tela de login.
    );
  }
}
