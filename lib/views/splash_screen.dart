import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/repositories/banco_repository.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimeout() {
    return Timer(Duration(seconds: 5), changeScreen);
  }

  changeScreen() async {
    Modular.to.pushReplacementNamed('/login');
  }

  inicializaBanco() async {
    final bh = Modular.get<BancoRepository>();
    await bh.db;
    changeScreen();
  }

  @override
  void initState() {
    super.initState();
    inicializaBanco();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/tickets.png'),
              const Text(
                'GoPass',
                style: TextStyle(
                    fontSize: 75,
                    color: Color.fromRGBO(85, 218, 243, 1),
                    fontWeight: FontWeight.w500),
              ),
              Image.asset('assets/images/loading.gif'),
            ],
          ),
        ),
      ),
    );
  }
}
