import 'package:flutter/material.dart';

class BottomMenuAdmin extends StatelessWidget {
  final Function(int) abaSelecionada;
  int index = 0;
  BottomMenuAdmin(this.abaSelecionada, this.index);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: abaSelecionada,
      currentIndex: index,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.add_location), label: "Eventos"),
        BottomNavigationBarItem(
            icon: Icon(Icons.add), label: "Cadastro de eventos"),
      ],
    );
  }
}
