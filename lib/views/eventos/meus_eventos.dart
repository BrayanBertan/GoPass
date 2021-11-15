import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/stores/reserva_store.dart';
import 'package:gopass_app/views/eventos/componentes/dialog_reserva.dart';
import 'package:intl/intl.dart';

final reservaStore = Modular.get<ReservaStore>();

class MeusEventosPage extends StatefulWidget {
  const MeusEventosPage({Key? key}) : super(key: key);

  @override
  _MeusEventosPageState createState() => _MeusEventosPageState();
}

class _MeusEventosPageState extends State<MeusEventosPage> {
  @override
  void initState() {
    reservaStore.getAllReservasUsuario();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var format = DateFormat('dd/MM/yyyy HH:mm');
    return Scaffold(
      body: Stack(
        children: [
          Observer(builder: (_) {
            return ListView.builder(
                padding: EdgeInsets.all(25),
                itemCount: reservaStore.reservasUsuario.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(5),
                    child: ListTile(
                      onTap: () {
                        reservaStore
                            .getEvento(
                                reservaStore.reservasUsuario[index].evento_id!)!
                            .then((value) {
                          showDialog(
                                  context: context,
                                  builder: (_) {
                                    return DialogReserva(value,
                                        reservaStore.reservasUsuario[index]);
                                  })
                              .then((value) =>
                                  reservaStore.getAllReservasUsuario());
                        });
                      },
                      leading: Image.file(
                        File(reservaStore.reservasUsuario[index].foto!),
                      ),
                      title: Text(
                          '${reservaStore.reservasUsuario[index].evento}-${format.format(reservaStore.reservasUsuario[index].data_evento!)}'),
                      trailing: Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                            color: (reservaStore
                                            .reservasUsuario[index].data_evento!
                                            .difference(DateTime.now())
                                            .inHours <
                                        24 &&
                                    reservaStore.reservasUsuario[index]
                                            .total_vendido! <
                                        reservaStore.reservasUsuario[index]
                                            .lotacao_minima!)
                                ? Colors.grey
                                : reservaStore.reservaStatus(
                                    reservaStore
                                        .reservasUsuario[index].data_reserva!,
                                    reservaStore.reservasUsuario[index]
                                        .confirmada!)['color'],
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: EdgeInsets.all(3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                (reservaStore.reservasUsuario[index]
                                                .data_evento!
                                                .difference(DateTime.now())
                                                .inHours <
                                            24 &&
                                        reservaStore.reservasUsuario[index]
                                                .total_vendido! <
                                            reservaStore.reservasUsuario[index]
                                                .lotacao_minima!)
                                    ? 'Evento Cancelado'
                                    : 'Pagamento ${reservaStore.reservaStatus(reservaStore.reservasUsuario[index].data_reserva!, reservaStore.reservasUsuario[index].confirmada!)['status']}',
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }),
          Observer(builder: (_) {
            return reservaStore.loading
                ? IgnorePointer(
                    ignoring: reservaStore.loading,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.black26,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                : Container();
          })
        ],
      ),
    );
  }
}
