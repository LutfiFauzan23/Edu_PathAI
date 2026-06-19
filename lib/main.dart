import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const SnbpApp());
}

class SnbpApp extends StatelessWidget {
  const SnbpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persiapan SNBP/SNBT',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const LoginScreen(),
    );
  }
}
