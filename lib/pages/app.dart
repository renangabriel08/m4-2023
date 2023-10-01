import 'package:flutter/material.dart';
import 'package:m4/pages/configuracoes.dart';
import 'package:m4/pages/home.dart';
import 'package:m4/pages/roteiro.dart';
import 'package:m4/pages/viajante.dart';
import 'package:m4/styles/cores.dart';
import 'package:m4/styles/fonts.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class ScreenArguments {
  final String nome;
  final String email;

  ScreenArguments(this.nome, this.email);
}

class _AppState extends State<App> {
  int paginaSelecionada = 0;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Cores.azulEscuro,
        title: Text(
          'EUVOUNATRIP',
          style: TextStyle(
            fontFamily: Fonts.font,
            fontSize: Fonts.fontSizeNormal,
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Cores.azulEscuro,
                ),
                currentAccountPicture: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: Cores.azulClaro,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
                accountName: Text(
                  args.nome,
                  style: TextStyle(
                    fontSize: Fonts.fontSizeNormal,
                    fontFamily: Fonts.font,
                  ),
                ),
                accountEmail: Text(
                  args.email,
                  style: TextStyle(
                    fontSize: Fonts.fontSizeNormal,
                    fontFamily: Fonts.font,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(color: Cores.azulEscuro, Icons.home),
                  title: Text(
                    'Home',
                    style: TextStyle(
                      fontFamily: Fonts.font,
                      fontSize: Fonts.fontSizeNormal,
                      color: Cores.azulEscuro,
                    ),
                  ),
                  onTap: () => setState(() {
                    paginaSelecionada = 0;
                    Navigator.pop(context);
                  }),
                ),
                ListTile(
                  leading: Icon(color: Cores.azulEscuro, Icons.public),
                  title: Text(
                    'Roteiro Personalizado',
                    style: TextStyle(
                      fontFamily: Fonts.font,
                      fontSize: Fonts.fontSizeNormal,
                      color: Cores.azulEscuro,
                    ),
                  ),
                  onTap: () => setState(() {
                    paginaSelecionada = 1;
                    Navigator.pop(context);
                  }),
                ),
                ListTile(
                  leading: Icon(color: Cores.azulEscuro, Icons.luggage),
                  title: Text(
                    'Viajante Gameficado',
                    style: TextStyle(
                      fontFamily: Fonts.font,
                      fontSize: Fonts.fontSizeNormal,
                      color: Cores.azulEscuro,
                    ),
                  ),
                  onTap: () => setState(() {
                    paginaSelecionada = 2;
                    Navigator.pop(context);
                  }),
                ),
                ListTile(
                  leading: Icon(color: Cores.azulEscuro, Icons.settings),
                  title: Text(
                    'Configurações de Usuário',
                    style: TextStyle(
                      fontFamily: Fonts.font,
                      fontSize: Fonts.fontSizeNormal,
                      color: Cores.azulEscuro,
                    ),
                  ),
                  onTap: () => setState(() {
                    paginaSelecionada = 3;
                    Navigator.pop(context);
                  }),
                ),
                ListTile(
                  leading: Icon(color: Cores.azulEscuro, Icons.logout),
                  title: Text(
                    'Sair',
                    style: TextStyle(
                      fontFamily: Fonts.font,
                      fontSize: Fonts.fontSizeNormal,
                      color: Cores.azulEscuro,
                    ),
                  ),
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/login',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: IndexedStack(
        index: paginaSelecionada,
        children: [
          const Home(),
          const Roteiro(),
          const Viajante(),
          const Configuracoes(),
        ],
      ),
    );
  }
}
