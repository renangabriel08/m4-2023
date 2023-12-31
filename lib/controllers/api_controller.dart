import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:m4/pages/app.dart';

class ApiController {
  static logar(String email, String senha, context) async {
    final url = Uri.parse(
      'https://apieuvounatrip.azurewebsites.net/api/Usuarios/Login?email=$email&senha=$senha',
    );
    final req = await http.post(url);
    if (req.statusCode == 200) {
      Navigator.pushNamed(
        context,
        '/app',
        arguments: ScreenArguments('Teste', email),
      );
    }
  }
}
