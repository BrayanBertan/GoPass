import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gopass_app/stores/evento_store.dart';
import 'package:intl/intl.dart';

final eventoStore = EventoStore();

class EventosGridItem extends StatefulWidget {
  var index;
  EventosGridItem({this.index});
  @override
  _EventosGridItemState createState() => _EventosGridItemState(this.index);
}

class _EventosGridItemState extends State<EventosGridItem> {
  @override
  void initState() {
    eventoStore.getAllEventos();
    super.initState();
  }

  var index;
  _EventosGridItemState(this.index);
  var format = DateFormat('dd/MM/yyyy');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 8,
        child: Scaffold(
          bottomNavigationBar:
              ElevatedButton(onPressed: () {}, child: Text('Comprar')),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  this.index?.foto != null
                      ? Image.file(
                          File(this.index?.foto),
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: 125,
                        )
                      : Image.asset(
                          'assets/images/dance.png',
                          fit: BoxFit.fill,
                          height: 125,
                        ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: new BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                          )),
                      margin: const EdgeInsets.only(left: 0),
                      child: Center(
                        child: Text(
                          format.format(this.index.data_evento),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                '${this.index.nome}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ListTile(
                        minLeadingWidth: 10,
                        leading: Image.asset(
                          'assets/images/location.png',
                          width: 25,
                          height: 25,
                        ),
                        title: Text(
                          '${this.index.endereco}',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
