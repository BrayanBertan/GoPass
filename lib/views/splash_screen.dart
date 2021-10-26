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
    return Timer(Duration(seconds: 3), changeScreen);
  }

  changeScreen() async {
    Modular.to.pushReplacementNamed('/login');
  }

  inicializaBanco() async {
    final br = Modular.get<BancoRepository>();
    await br.db;
    startTimeout();
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/gopass-logo.png'),
              Image.asset('assets/images/loading.gif'),
            ],
          ),
        ),
      ),
    );
  }
}
