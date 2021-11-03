import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/models/reserva_model.dart';
import 'package:gopass_app/stores/reserva_store.dart';
import 'package:gopass_app/views/eventos/meus_eventos.dart';

ReservaStore eventoStore = Modular.get<ReservaStore>();

class ReservaPage extends StatefulWidget {
  Reserva reserva;
  ReservaPage(this.reserva);

  @override
  _ReservaPageState createState() => _ReservaPageState(this.reserva);
}

class _ReservaPageState extends State<ReservaPage> {
  Reserva reserva;
  _ReservaPageState(this.reserva);

  @override
  void initState() {
    eventoStore.getAllAssentosReserva(reserva.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.file(
              File(reserva.foto!),
              fit: BoxFit.fitWidth,
              height: 300,
            ),
            Text(
              reserva.evento!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40),
            ),
            Card(
              child: Column(
                children: [
                  Text(
                    'Meus Ingressos',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                  Container(
                      height: 200,
                      child: Observer(
                        builder: (_) {
                          return ListView.builder(
                              itemCount:
                                  reservaStore.assentosReservaAtual.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                      'Assento escolhido -> ${reservaStore.assentosReservaAtual[index].fileira}${reservaStore.assentosReservaAtual[index].numero}'),
                                  leading:
                                      Image.asset('assets/images/seats.png'),
                                  trailing: Wrap(
                                    children: [
                                      Text('Ingresso ->'),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.qr_code))
                                    ],
                                  ),
                                );
                              });
                        },
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}