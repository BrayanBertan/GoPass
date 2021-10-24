import 'package:flutter/material.dart';

class BottomMenuAdmin extends StatelessWidget {
  const BottomMenuAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.add_location), label: "Eventos"),
        BottomNavigationBarItem(
            icon: Icon(Icons.add), label: "Cadastro de eventos"),
      ],
    );
  }
}
