import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/models/evento_model.dart';
import 'package:gopass_app/models/reserva_model.dart';
import 'package:gopass_app/stores/filter_store.dart';

class DialogReserva extends StatefulWidget {
  Evento evento;
  Reserva reserva;
  DialogReserva(this.evento, this.reserva);

  @override
  _DialogReservaState createState() =>
      _DialogReservaState(this.evento, this.reserva);
}

class _DialogReservaState extends State<DialogReserva> {
  FilterStore filterStore = Modular.get<FilterStore>().clone();
  Evento evento;
  Reserva reserva;
  _DialogReservaState(this.evento, this.reserva);

  @override
  void initState() {
    filterStore.getAllCategorias();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      width: 500,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.file(File(evento.foto!)),
          Text(
            evento.nome!,
            style: TextStyle(fontSize: 25),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Modular.to.pushNamed('/evento-info', arguments: evento);
                  },
                  child: Text('Dados do evento')),
              ElevatedButton(
                  onPressed: () {
                    Modular.to.pushNamed('/reserva', arguments: reserva);
                  },
                  child: Text('Dados da reserva'))
            ],
          )
        ],
      ),
    ));
  }
}
