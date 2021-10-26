import 'package:flutter/material.dart';
import 'package:gopass_app/stores/evento_store.dart';
import 'package:gopass_app/views/eventos/componentes/dialog_filtros.dart';

class BarraFiltros extends StatefulWidget {
  final TextEditingController searchController;
  EventoStore eventoStore;
  BarraFiltros(this.searchController, this.eventoStore);

  @override
  _BarraFiltrosState createState() =>
      _BarraFiltrosState(this.searchController, this.eventoStore);
}

class _BarraFiltrosState extends State<BarraFiltros> {
  final TextEditingController searchController;
  EventoStore eventoStore;
  _BarraFiltrosState(this.searchController, this.eventoStore);
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
                  controller: searchController,
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
                    onPressed: () {
                      eventoStore.setSearch(searchController.text);
                    }),
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
