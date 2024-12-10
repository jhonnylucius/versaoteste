import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'navigation/app_router.dart';
import 'navigation/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
