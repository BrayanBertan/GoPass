import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/models/reserva_model.dart';
import 'package:gopass_app/stores/reserva_store.dart';
import 'package:gopass_app/views/eventos/componentes/dialog_ingresso.dart';
import 'package:gopass_app/views/eventos/componentes/dialog_pagamento.dart';
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
    reservaStore.getDesconto();
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
                  const Text(
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
                                          onPressed: reserva.confirmada == 1
                                              ? () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (_) {
                                                        return DialogIngresso(
                                                            reserva,
                                                            '${reservaStore.assentosReservaAtual[index].fileira}${reservaStore.assentosReservaAtual[index].numero}');
                                                      });
                                                }
                                              : null,
                                          icon: Icon(Icons.qr_code))
                                    ],
                                  ),
                                );
                              });
                        },
                      )),
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Observer(builder: (_) {
                      return ElevatedButton(
                        onPressed: (reserva.confirmada == 0 &&
                                    DateTime.now()
                                            .difference(reserva.data_reserva!)
                                            .inHours <=
                                        24) &&
                                !(reserva.data_evento!
                                            .difference(DateTime.now())
                                            .inHours <=
                                        24 &&
                                    reserva.total_vendido! <
                                        reserva.lotacao_minima!)
                            ? () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return DialogPagamento(
                                          reserva, reservaStore);
                                    }).then((value) {
                                  setState(() {
                                    reserva.confirmada = value ?? 0;
                                    if (reserva.confirmada == 1) {
                                      eventoStore.setFidelidade();
                                      reservaStore.updatePagamento(reserva);
                                    }
                                  });
                                });
                              }
                            : null,
                        child: Observer(
                          builder: (_) {
                            return Text(
                              'Pagar R\$${((reserva.valor! * reserva.qtde_ingressos!) - ((reserva.valor! * reserva.qtde_ingressos!) * reservaStore.desconto)).toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                  ListTile(
                    leading: Text(
                        (reserva.data_evento!
                                        .difference(DateTime.now())
                                        .inHours <
                                    24 &&
                                reserva.total_vendido! <
                                    reserva.lotacao_minima!)
                            ? 'Evento Cancelado'
                            : 'Pagamento ${reservaStore.reservaStatus(reserva.data_reserva!, reserva.confirmada!)['status']}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        )),
                    title: Container(
                      width: 5,
                      height: 50,
                      decoration: BoxDecoration(
                          color: (reserva.data_evento!
                                          .difference(DateTime.now())
                                          .inHours <
                                      24 &&
                                  reserva.total_vendido! <
                                      reserva.lotacao_minima!)
                              ? Colors.grey
                              : reservaStore.reservaStatus(
                                  reserva.data_reserva!,
                                  reserva.confirmada!)['color'],
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  )
                ],
              ),
            ),
            const Text('Programa de fidelidade',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                )),
            LayoutBuilder(
              builder: (context, constraints) => Container(
                  padding: EdgeInsets.all(5),
                  width: double.infinity,
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.bottomLeft,
                                width: constraints.maxWidth * 0.187,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: LayoutBuilder(
                                  builder: (context, con) {
                                    return Container(
                                      width: con.maxWidth *
                                          reservaStore.getStageFidelidade(
                                              index + 1)['porBar'],
                                      height: 20,
                                      color: Colors.green,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: constraints.maxWidth * 0.01,
                              )
                            ],
                          ),
                          Text(
                              '${reservaStore.getStageFidelidade(index + 1)['porText']}%'),
                        ],
                      );
                    },
                  )),
            ),
            Text(
                '   *3% de desconto a cada 10 compras. você tem ${reservaStore.fidelidade} compras')
          ],
        ),
      ),
    );
  }
}
