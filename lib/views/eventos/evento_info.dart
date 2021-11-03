import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/models/evento_model.dart';
import 'package:gopass_app/stores/evento_store.dart';
import 'package:gopass_app/stores/reserva_store.dart';
import 'package:intl/intl.dart';

EventoStore eventoStore = Modular.get<EventoStore>();

class EventoInfoPage extends StatefulWidget {
  Evento evento;
  EventoInfoPage(this.evento);

  @override
  _EventoInfoPageState createState() => _EventoInfoPageState(this.evento);
}

class _EventoInfoPageState extends State<EventoInfoPage> {
  Evento evento;
  _EventoInfoPageState(this.evento);

  late ReservaStore reservaStore;
  late int assento;
  @override
  void initState() {
    assento = 0;
    reservaStore = ReservaStore();
    reservaStore.getAllReservaS(evento.id!);
    reservaStore.preco = evento.valor!;
    super.initState();
  }

  var format = DateFormat('dd/MM/yyyy HH:mm');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(format.format(evento.data_evento!)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.file(
              File(evento.foto ?? ''),
              fit: BoxFit.fitWidth,
              height: 300,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              child: Stack(
                children: [
                  Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              evento.nome!,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 40),
                            ),
                            Text(
                              evento.descricao!,
                              style: TextStyle(fontSize: 25),
                            )
                          ],
                        ),
                      )),
                  Column(
                    children: [
                      CircleAvatar(
                        child: Image.asset('assets/images/preco.png'),
                      ),
                      Text(
                        'R\$ ${evento.valor!.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              child: Stack(
                children: [
                  Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              format.format(evento.data_evento!),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(
                              evento.endereco!,
                              style: TextStyle(fontSize: 25),
                            )
                          ],
                        ),
                      )),
                  CircleAvatar(
                    child: Image.asset('assets/images/location.png'),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              child: Stack(
                children: [
                  Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Text(
                              'Escolha os assentos',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 30),
                            ),
                            Image.asset(
                              'assets/images/stage.png',
                              height: 200,
                            ),
                            Observer(builder: (_) {
                              return GridView.builder(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.all(10),
                                itemCount: reservaStore
                                    .numeroGrid(evento.lotacao_maxima!),
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        mainAxisExtent: 25,
                                        maxCrossAxisExtent: 25,
                                        crossAxisSpacing: 3,
                                        mainAxisSpacing: 3),
                                itemBuilder: (context, index) {
                                  if (reservaStore
                                          .numeroGrid(evento.lotacao_maxima!) ==
                                      index + 1) return Container();
                                  if (index == 0 || index % 12 == 0) {
                                    reservaStore.alfabetoIndex++;
                                    return Text(reservaStore
                                        .alfabeto[reservaStore.alfabetoIndex]);
                                  } else {
                                    assento++;
                                    int gambiarra = assento;
                                    return Tooltip(
                                      message:
                                          '${reservaStore.alfabeto[reservaStore.alfabetoIndex]}$assento',
                                      child: Observer(
                                        builder: (_) {
                                          return GestureDetector(
                                            onTap: !reservaStore.reservasAssento
                                                    .contains(gambiarra)
                                                ? () {
                                                    print(gambiarra);
                                                    reservaStore
                                                        .setAssentosSelecionados(
                                                            gambiarra);
                                                  }
                                                : null,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: reservaStore
                                                          .reservasAssento
                                                          .contains(gambiarra)
                                                      ? Colors.grey[500]
                                                      : reservaStore
                                                              .assentosSelecionados
                                                              .contains(
                                                                  gambiarra)
                                                          ? Colors
                                                              .lightGreenAccent
                                                          : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: Colors.black,
                                                      width: 1)),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }
                                },
                              );
                            }),
                          ],
                        ),
                      )),
                  CircleAvatar(
                    child: Image.asset('assets/images/seats.png'),
                  ),
                ],
              ),
            ),
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
              ),
              child: Observer(builder: (_) {
                return ElevatedButton(
                  onPressed: reservaStore.isValid
                      ? () {
                          reservaStore.Reservar().then((value) {
                            eventoStore.setAbaIndex(1);
                            Modular.to.pop();
                          });
                        }
                      : null,
                  child: Text(
                    'Reservar R\$ ${reservaStore.valorTotalReserva}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
