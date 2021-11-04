import 'dart:io';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gopass_app/models/evento_model.dart';
import 'package:gopass_app/models/grafico_model.dart';
import 'package:gopass_app/stores/reserva_store.dart';
import 'package:intl/intl.dart';

final reservaStore = ReservaStore();

class EventoGraficosPage extends StatefulWidget {
  Evento evento;
  EventoGraficosPage(this.evento);

  @override
  _EventoGraficosPageState createState() =>
      _EventoGraficosPageState(this.evento);
}

class _EventoGraficosPageState extends State<EventoGraficosPage> {
  Evento evento;
  _EventoGraficosPageState(this.evento);

  static List<charts.Series<GraficoBarra, String>> seriesgrafico = [
    charts.Series<GraficoBarra, String>(
      id: 'graficoId',
      colorFn: (GraficoBarra segment, __) {
        switch (segment.eixoX) {
          case 'pendente':
            return charts.MaterialPalette.yellow.shadeDefault;
          case 'confirmado':
            return charts.MaterialPalette.green.shadeDefault;
          default:
            return charts.MaterialPalette.gray.shadeDefault;
        }
      },
      domainFn: (GraficoBarra series, _) => series.eixoX!,
      measureFn: (GraficoBarra series, _) => series.eixoY!.toDouble(),
      data: reservaStore.grafico,
    )
  ];

  @override
  void initState() {
    reservaStore.getGrafico(evento.id!);
    super.initState();
  }

  DateFormat format = DateFormat('dd/MM/yyyy HH:mm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) {
            return !reservaStore.loading
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.file(
                        File(evento.foto!),
                        fit: BoxFit.fitWidth,
                        height: 300,
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          '#${evento.id}-${evento.nome}(${format.format(evento.data_evento!)})',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Observer(builder: (_) {
                        return reservaStore.grafico.length > 0
                            ? Container(
                                height: 400,
                                padding: EdgeInsets.all(20),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        const Text(
                                          "Reservas",
                                          style: TextStyle(fontSize: 30),
                                        ),
                                        Expanded(
                                          child: charts.BarChart(
                                            seriesgrafico,
                                            animate: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Container();
                      }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.blue),
                              ),
                              Observer(builder: (_) {
                                return Text('Total ${reservaStore.quantidade}');
                              })
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.green),
                              ),
                              Observer(builder: (_) {
                                return Text(
                                    'Confirmados ${reservaStore.quantidadeConfirmado}');
                              })
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.yellow),
                              ),
                              Observer(builder: (_) {
                                return Text(
                                    'Pendentes ${reservaStore.quantidadePendente}');
                              })
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.grey),
                              ),
                              Observer(builder: (_) {
                                return Text(
                                    'Cancelados ${reservaStore.quantidadeCancelado}');
                              })
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                : Container();
          },
        ),
      ),
    );
  }
}
