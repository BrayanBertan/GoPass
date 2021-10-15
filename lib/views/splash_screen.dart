import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500))
        .then((value) => Modular.to.pushReplacementNamed('/login'));
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
