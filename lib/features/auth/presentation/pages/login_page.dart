import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  // Chave global para o formulário para validação.
  final _formKey = GlobalKey<FormState>();
  // Instância do FirebaseAuth para autenticação com Firebase.
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Instância do GoogleSignIn para login com Google.
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  // Controladores para os campos de texto de email e senha.
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // Logger para exibir mensagens de erro.
  final Logger _logger = Logger();

  // Função assíncrona para realizar login com email e senha.
  Future<void> _loginWithEmail() async {
    // Valida o formulário antes de prosseguir.
    if (_formKey.currentState!.validate()) {
      try {
        // Tenta fazer login com email e senha usando o Firebase Auth.
        await _auth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        // Navegar para a próxima tela após o login bem-sucedido.
      } catch (e) {
        // Loga o erro caso o login falhe.
        _logger.e('Erro ao fazer login com email: $e');
      }
    }
  }

  // Função assíncrona para realizar login com Google.
  Future<void> _loginWithGoogle() async {
    try {
      // Inicia o processo de login com Google.
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      // Obtém as credenciais de autenticação do usuário Google.
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      // Cria as credenciais para o Firebase usando as credenciais do Google.
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Tenta fazer login com as credenciais do Google no Firebase.
      await _auth.signInWithCredential(credential);
      // Navegar para a próxima tela após o login bem-sucedido.
    } catch (e) {
      // Loga o erro caso o login falhe.
      _logger.e('Erro ao fazer login com Google: $e');
    }
  }

  // Função assíncrona para realizar login com Facebook.
  Future<void> _loginWithFacebook() async {
    try {
      // Inicia o processo de login com Facebook.
      final LoginResult result = await FacebookAuth.instance.login();
      // Verifica se o login foi bem-sucedido.
      if (result.status == LoginStatus.success) {
        // Obtém o token de acesso do Facebook.
        final AccessToken accessToken = result.accessToken!;
        // Cria as credenciais para o Firebase usando o token do Facebook.
        final AuthCredential credential =
            FacebookAuthProvider.credential(accessToken.tokenString);
        // Tenta fazer login com as credenciais do Facebook no Firebase.
        await _auth.signInWithCredential(credential);
        // Navegar para a próxima tela após o login bem-sucedido.
      } else {
        // Loga o erro caso o login do Facebook falhe.
        _logger.e('Erro ao fazer login com Facebook: ${result.message}');
      }
    } catch (e) {
      // Loga o erro caso o login falhe.
      _logger.e('Erro ao fazer login com Facebook: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Envolve o formulário com o widget Form.
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Campo de texto para email.
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                // Validador para o campo de email.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu email';
                  }
                  return null;
                },
              ),
              // Campo de texto para senha.
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
              ),
              // Botão para login com email.
              ElevatedButton(
                onPressed: _loginWithEmail,
                child: Text('Login com Email'),
              ),
              // Botão para login com Google.
              ElevatedButton(
                onPressed: _loginWithGoogle,
                child: Text('Login com Google'),
              ),
              // Botão para login com Facebook.
              ElevatedButton(
                onPressed: _loginWithFacebook,
                child: Text('Login com Facebook'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
