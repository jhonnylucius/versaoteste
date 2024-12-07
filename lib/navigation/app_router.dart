import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/pages/complete_profile_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/signup_page.dart';
import '../features/home/presentation/pages/add_service_page.dart';
import '../features/home/presentation/pages/favorites_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/home/presentation/pages/review_service_page.dart';
import '../features/home/presentation/pages/service_details_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());

      case '/signup':
        return MaterialPageRoute(builder: (_) => SignupPage());

      case '/complete-profile':
        if (settings.arguments is String) {
          final String userType = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => CompleteProfilePage(userType: userType),
          );
        }
        return _errorRoute('Argumento ausente para /complete-profile');

      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage(services: []));

      case '/favorites':
        return MaterialPageRoute(
          builder: (_) => FavoritesPage(
            favoriteProviders: [],
            onProviderTap: (provider) {
              if (kDebugMode) {
                print("Prestador selecionado: ${provider['name']}");
              }
            },
          ),
        );

      case '/service-details':
        if (settings.arguments is Map<String, dynamic>) {
          final Map<String, dynamic> service =
              settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (_) => ServiceDetailsPage(service: service),
          );
        }
        return _errorRoute('Argumento ausente para /service-details');

      case '/review-service':
        if (settings.arguments is Map<String, dynamic>) {
          final Map<String, dynamic> service =
              settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (_) => ReviewServicePage(service: service),
          );
        }
        return _errorRoute('Argumento ausente para /review-service');

      case '/add-service':
        return MaterialPageRoute(
          builder: (_) => AddServicePage(
            onAddService: (String name, double price, String description) {
              if (kDebugMode) {
                print(
                    "Serviço adicionado: Nome=$name, Preço=$price, Descrição=$description");
              }
            },
          ),
        );

      default:
        return _errorRoute('Rota não definida: ${settings.name}');
    }
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}
