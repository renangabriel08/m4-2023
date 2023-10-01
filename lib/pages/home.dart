import 'package:flutter/material.dart';
import 'package:m4/styles/fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Text(
          'Home',
          style: TextStyle(
            fontFamily: Fonts.font,
            fontSize: Fonts.fontSizeNormal,
          ),
        ),
      ),
    );
  }
}
