import 'package:flutter/material.dart';
import 'theme/dos_theme.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/call_screen.dart';
import 'screens/invite_screen.dart';

void main() {
  runApp(const ParrotApp());
}

class ParrotApp extends StatelessWidget {
  const ParrotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parrot OS',
      debugShowCheckedModeBanner: false,
      theme: DosTheme.themeData,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/call': (context) => const CallScreen(),
        '/invite': (context) => const InviteScreen(),
      },
    );
  }
}
