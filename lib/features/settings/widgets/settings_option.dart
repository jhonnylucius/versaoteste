// Importa o pacote Flutter para construir a interface do usuário.
import 'package:flutter/material.dart';

// Classe `SettingsOption`.
// Representa um item de configuração individual em uma lista de configurações.
class SettingsOption extends StatelessWidget {
  // Título do item de configuração (exemplo: "Account", "Notifications").
  final String title;

  // Ícone exibido ao lado do título.
  final IconData icon;

  // Função de callback acionada quando o item é tocado.
  final VoidCallback onTap;

  // Construtor da classe `SettingsOption`.
  // Recebe os parâmetros `title`, `icon` e `onTap` como obrigatórios.
  const SettingsOption({
    super.key,
    required this.title, // Título do item.
    required this.icon, // Ícone associado ao item.
    required this.onTap, // Função chamada ao tocar no item.
  });

  // Método `build` que constrói a interface gráfica do item.
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // Ícone exibido à esquerda do título.
      leading: Icon(
        icon, // Define o ícone a ser exibido.
        size: 28.0, // Define o tamanho do ícone.
      ),

      // Título do item de configuração.
      title: Text(
        title, // Texto exibido como título.
        style: const TextStyle(
            fontSize: 18.0), // Estilo com tamanho de fonte fixo.
      ),

      // Callback acionado ao tocar no item.
      onTap: onTap,
    );
  }
}
