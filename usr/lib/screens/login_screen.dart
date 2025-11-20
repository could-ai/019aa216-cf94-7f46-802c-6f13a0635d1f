import 'package:flutter/material.dart';
import '../theme/dos_theme.dart';
import '../widgets/dos_components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    if (_usernameController.text.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/home', arguments: _usernameController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.terminal, size: 64, color: DosTheme.primary),
                  const SizedBox(height: 16),
                  Text(
                    'PARROT_OS v1.0',
                    style: DosTheme.headerStyle,
                  ),
                  const SizedBox(height: 8),
                  const Text('EST. 1985 - SQUAWK NET', textAlign: TextAlign.center),
                  const SizedBox(height: 48),
                  DosBox(
                    child: Column(
                      children: [
                        DosTextField(
                          controller: _usernameController,
                          label: 'USERNAME',
                        ),
                        const SizedBox(height: 16),
                        DosTextField(
                          controller: _passwordController,
                          label: 'PASSWORD',
                          obscureText: true,
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: DosButton(
                            label: 'LOGIN',
                            onPressed: _handleLogin,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text('PRESS ANY KEY TO SQUAWK...', style: DosTheme.textStyle.copyWith(fontSize: 14)),
                ],
              ),
            ),
          ),
          const DosScanline(),
        ],
      ),
    );
  }
}
