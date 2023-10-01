import 'package:flutter/material.dart';
import 'package:m4/styles/fonts.dart';

class Roteiro extends StatelessWidget {
  const Roteiro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Text(
          'Tela Roteiro Personalizado',
          style: TextStyle(
            fontFamily: Fonts.font,
            fontSize: Fonts.fontSizeNormal,
          ),
        ),
      ),
    );
  }
}
