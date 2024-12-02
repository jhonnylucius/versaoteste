import 'package:flutter/material.dart';

import '../domain/usecases/login_with_facebook.dart';
import '../domain/usecases/login_with_google.dart';

class SocialLoginButtons extends StatelessWidget {
  final LoginWithGoogle loginWithGoogle;
  final LoginWithFacebook loginWithFacebook;

  const SocialLoginButtons({
    super.key,
    required this.loginWithGoogle,
    required this.loginWithFacebook,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () async {
            try {
              await loginWithGoogle();
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Erro ao fazer login com Google: \$e")),
              );
            }
          },
          icon: const Icon(Icons.login),
          label: const Text("Entrar com Google"),
        ),
        ElevatedButton.icon(
          onPressed: () async {
            try {
              await loginWithFacebook();
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text("Erro ao fazer login com Facebook: \$e")),
              );
            }
          },
          icon: const Icon(Icons.facebook),
          label: const Text("Entrar com Facebook"),
        ),
      ],
    );
  }
}
