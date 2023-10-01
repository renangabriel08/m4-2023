import 'package:flutter/material.dart';
import 'package:m4/styles/fonts.dart';

class Viajante extends StatelessWidget {
  const Viajante({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Text(
          'Tela Viajante Gamificado',
          style: TextStyle(
            fontFamily: Fonts.font,
            fontSize: Fonts.fontSizeNormal,
          ),
        ),
      ),
    );
  }
}
