import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:versaoteste/firebase_options.dart';

import 'navigation/app_router.dart';
import 'navigation/navigation_service.dart';

// main.dart precisa usar firebase_options.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Adicionar tratamento de erros global
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Ocorreu um erro: ${details.exception}'),
        ),
      ),
    );
  };
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgendaPro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark(),
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/login',
    );
  }
}
