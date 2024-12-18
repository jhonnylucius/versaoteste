// Importa as bibliotecas necessárias do Flutter.
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Importa as páginas do aplicativo, organizadas por funcionalidades (features).
import '../features/auth/presentation/pages/complete_profile_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/signup_page.dart';
import '../features/home/presentation/pages/add_service_page.dart';
import '../features/home/presentation/pages/favorites_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/home/presentation/pages/review_service_page.dart';
import '../features/home/presentation/pages/service_details_page.dart';

class AppRouter {
  // Método estático para gerar rotas com base nas configurações da rota.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Utiliza um switch para definir as rotas disponíveis.
    switch (settings.name) {
      // Rota para a página de login.
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());

      // Rota para a página de cadastro.
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignupPage());

      // Rota para a página de completar o perfil.  Verifica se um argumento (tipo de usuário) foi passado.
      case '/complete-profile':
        if (settings.arguments is String) {
          final String userType = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => CompleteProfilePage(
                userType: userType), // Passa o tipo de usuário para a página.
          );
        }
        return _errorRoute(
            'Argumento ausente para /complete-profile'); // Retorna uma rota de erro se o argumento estiver faltando.

      // Rota para a página inicial.
      case '/home':
        return MaterialPageRoute(
            builder: (_) => const HomePage(
                services: [])); // Inicializa com uma lista de serviços vazia.

      // Rota para a página de favoritos.
      case '/favorites':
        return MaterialPageRoute(
          builder: (_) => FavoritesPage(
            favoriteProviders: [], // Inicializa com uma lista de provedores vazia.
            onProviderTap: (provider) {
              // Função chamada quando um provedor é selecionado (apenas em modo de debug).
              if (kDebugMode) {
                print("Prestador selecionado: ${provider['name']}");
              }
            },
          ),
        );

      // Rota para a página de detalhes do serviço. Verifica se um argumento (detalhes do serviço) foi passado.
      case '/service-details':
        if (settings.arguments is Map<String, dynamic>) {
          final Map<String, dynamic> service =
              settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (_) => ServiceDetailsPage(
                service:
                    service), // Passa os detalhes do serviço para a página.
          );
        }
        return _errorRoute(
            'Argumento ausente para /service-details'); // Retorna uma rota de erro se o argumento estiver faltando.

      // Rota para a página de avaliação de serviço. Verifica se um argumento (detalhes do serviço) foi passado.
      case '/review-service':
        if (settings.arguments is Map<String, dynamic>) {
          final Map<String, dynamic> service =
              settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (_) => ReviewServicePage(
                service:
                    service), // Passa os detalhes do serviço para a página.
          );
        }
        return _errorRoute(
            'Argumento ausente para /review-service'); // Retorna uma rota de erro se o argumento estiver faltando.

      // Rota para a página de adicionar serviço.
      case '/add-service':
        return MaterialPageRoute(
          builder: (_) => AddServicePage(
            onAddService: (String name, double price, String description) {
              // Função chamada quando um serviço é adicionado (apenas em modo de debug).
              if (kDebugMode) {
                print(
                    "Serviço adicionado: Nome=$name, Preço=$price, Descrição=$description");
              }
            },
          ),
        );

      // Rota padrão para casos em que a rota não é encontrada.
      default:
        return _errorRoute('Rota não definida: ${settings.name}');
    }
  }
}

// Método para retornar uma rota de erro.
Route<dynamic> _errorRoute(String message) {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      appBar: AppBar(
        title: const Text('Erro'),
      ),
      body: Center(
        child: Text(message),
      ),
    ),
  );
}
