import 'package:flutter/material.dart';
import 'package:xyz/theme/theme_data.dart';
import 'package:xyz/ui/sign_in/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eridanus',
      theme: lightTheme,
      home: const SignInScreen(),
    );
  }
}
