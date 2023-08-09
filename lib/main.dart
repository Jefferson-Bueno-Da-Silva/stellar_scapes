import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stellar Scapes',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121214),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF202024),
          background: Color(0xFF121214),
          inversePrimary: Color(0xFFE1E1E6),
        ),
        fontFamily: 'Mulish',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFFC4C4CC)
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Color(0xFFE1E1E6)
          ),
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: Color(0xFFE1E1E6)
          ),
        )
      ),
      home: const MyHomePage(),
    );
  }
}

