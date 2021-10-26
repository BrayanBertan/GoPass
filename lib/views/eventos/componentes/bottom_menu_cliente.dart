import 'package:flutter/material.dart';

class BottomMenuCliente extends StatelessWidget {
  final Function(int) abaSelecionada;
  BottomMenuCliente(this.abaSelecionada);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: abaSelecionada,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.add_location), label: "Eventos"),
        BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined), label: "Meus eventos"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Meus dados"),
      ],
    );
  }
}
