import 'package:flutter/material.dart';
import 'package:gopass_app/views/eventos/componentes/dialog_filtros.dart';

class BarraFiltros extends StatefulWidget {
  const BarraFiltros({Key? key}) : super(key: key);

  @override
  _BarraFiltrosState createState() => _BarraFiltrosState();
}

class _BarraFiltrosState extends State<BarraFiltros> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 5,
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                    child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Pesquise',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: InputBorder.none,
                  ),
                )),
                IconButton(
                    iconSize: 30,
                    icon: Image.asset(
                      'assets/images/search.png',
                    ),
                    onPressed: () {}),
              ],
            )),
        IconButton(
          onPressed: () {
            showDialog(context: context, builder: (context) => DialogFiltros());
          },
          icon: Image.asset(
            'assets/images/filter.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
