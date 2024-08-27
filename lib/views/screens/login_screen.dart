import 'package:flutter/material.dart';
import 'package:asp_teste/core/errors/errors_classes.dart';
import 'package:asp_teste/domain/entity/user.dart';
import 'package:asp_teste/helper/user_manager.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const String _title = 'Login';
  static const String _emailLabel = 'Email';
  static const String _passwordLabel = 'Senha';
  static const String _loginButtonText = 'Entrar';
  static const String _registerButtonText = 'Não tem uma conta? Cadastre-se';
  static const String _errorEmptyFields = 'Por favor, preencha todos os campos.';
  static const String _errorIncorrectPassword = 'Senha incorreta.';
  static const String _errorUserNotFound = 'Usuário não encontrado.';
  static const String _errorLogin = 'Erro ao fazer login. Tente novamente.';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final UserManager userManager = UserManager(); // Certifique-se de que esta instância é compartilhada
  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = _errorEmptyFields;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final user = await userManager.getUserByUsername(email);
      final isPasswordValid = await userManager.verifyUser(email, password);

      if (isPasswordValid) {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      } else {
        if (mounted) {
          setState(() {
            _errorMessage = _errorIncorrectPassword;
          });
        }
      }
    } on UserNotFoundError {
      if (mounted) {
        setState(() {
          _errorMessage = _errorUserNotFound;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = _errorLogin;
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: _emailLabel),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: _passwordLabel),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              if (_isLoading)
                const CircularProgressIndicator(),
              if (_errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    _errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ElevatedButton(
                onPressed: _login,
                child: const Text(_loginButtonText),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text(_registerButtonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}