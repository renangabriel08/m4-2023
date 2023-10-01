import 'package:flutter/material.dart';
import 'package:m4/pages/app.dart';
import 'package:m4/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const Login(),
        '/app': (context) => const App(),
      },
      initialRoute: '/login',
    );
  }
}
