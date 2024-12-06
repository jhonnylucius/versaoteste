// Importa o pacote Flutter para construir a interface do usuário.
import 'package:flutter/material.dart';

// Classe `SettingsPage`.
// Representa a tela de configurações do aplicativo.
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key}); // Construtor padrão.

  // Método `build` que constrói a interface gráfica da página.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Barra de navegação no topo com o título "Settings".
        title: Text('Settings'), // Define o título da página.
      ),
      body: ListView(
        // Lista rolável para exibir as opções de configuração.
        children: [
          // Opção de configurações de conta.
          ListTile(
            leading: Icon(Icons.account_circle), // Ícone ao lado esquerdo.
            title: Text('Account'), // Texto descritivo da opção.
            onTap: () {
              // Navega para a tela de configurações de conta.
              // Implementação futura.
            },
          ),

          // Opção de configurações de notificações.
          ListTile(
            leading: Icon(Icons.notifications), // Ícone de notificações.
            title: Text('Notifications'), // Texto descritivo da opção.
            onTap: () {
              // Navega para a tela de configurações de notificações.
              // Implementação futura.
            },
          ),

          // Opção de configurações de privacidade.
          ListTile(
            leading: Icon(Icons.privacy_tip), // Ícone de privacidade.
            title: Text('Privacy'), // Texto descritivo da opção.
            onTap: () {
              // Navega para a tela de configurações de privacidade.
              // Implementação futura.
            },
          ),

          // Opção de ajuda e suporte.
          ListTile(
            leading: Icon(Icons.help), // Ícone de ajuda.
            title: Text('Help & Support'), // Texto descritivo da opção.
            onTap: () {
              // Navega para a tela de ajuda e suporte.
              // Implementação futura.
            },
          ),

          // Opção de logout.
          ListTile(
            leading: Icon(Icons.logout), // Ícone de logout.
            title: Text('Logout'), // Texto descritivo da opção.
            onTap: () {
              // Lógica de logout.
              // Implementação futura.
            },
          ),
        ],
      ),
    );
  }
}
