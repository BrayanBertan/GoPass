import 'package:flutter/material.dart';
import 'package:gopass_app/stores/evento_store.dart';
import 'package:gopass_app/views/eventos/componentes/dialog_filtros.dart';

class BarraFiltros extends StatefulWidget {
  final TextEditingController searchController;
  EventoStore eventoStore;
  void Function(String) search;
  BarraFiltros(this.searchController, this.eventoStore, this.search);

  @override
  _BarraFiltrosState createState() =>
      _BarraFiltrosState(this.searchController, this.eventoStore, this.search);
}

class _BarraFiltrosState extends State<BarraFiltros> {
  final TextEditingController searchController;
  EventoStore eventoStore;
  void Function(String) search;
  _BarraFiltrosState(this.searchController, this.eventoStore, this.search);
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
                Expanded(
                    child: TextField(
                  onChanged: search,
                  controller: searchController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    prefixIcon: Icon(Icons.search),
                    // border: InputBorder.none,
                  ),
                )),
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
