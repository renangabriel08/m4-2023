import 'package:flutter/material.dart';
import 'package:m4/styles/fonts.dart';

class Configuracoes extends StatelessWidget {
  const Configuracoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Text(
          'Configrações',
          style: TextStyle(
            fontFamily: Fonts.font,
            fontSize: Fonts.fontSizeNormal,
          ),
        ),
      ),
    );
  }
}
