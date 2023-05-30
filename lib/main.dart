import 'package:flutter/material.dart';
import 'package:tpm_responsi/views/auth/loginPage.dart';
import 'package:tpm_responsi/views/auth/signupPage.dart';
import 'package:tpm_responsi/views/homePage/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/home': (context) => const HomePage(),
      },
      title: 'Responsi',
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
