import 'package:flutter/material.dart';

class SocialLoginButtons extends StatelessWidget {
  final VoidCallback onGooglePressed;
  final VoidCallback onFacebookPressed;

  const SocialLoginButtons({
    super.key,
    required this.onGooglePressed,
    required this.onFacebookPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: onGooglePressed,
          icon: Icon(Icons.g_mobiledata),
          label: Text("Google"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
        ),
        ElevatedButton.icon(
          onPressed: onFacebookPressed,
          icon: Icon(Icons.facebook),
          label: Text("Facebook"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
        ),
      ],
    );
  }
}
