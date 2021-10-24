import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/stores/usuario_store.dart';

final usuarioStore = UsuarioStore();

class ListaEventosPage extends StatefulWidget {
  const ListaEventosPage({Key? key}) : super(key: key);

  @override
  _ListaEventosPageState createState() => _ListaEventosPageState();
}

class _ListaEventosPageState extends State<ListaEventosPage> {
  final usuarioStore = Modular.get<UsuarioStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Observer(builder: (_) {
                return CircleAvatar(
                    backgroundImage: usuarioStore.foto != null
                        ? FileImage(File(usuarioStore.foto!))
                        : ExactAssetImage('assets/images/avatar.png')
                    as ImageProvider,
                    minRadius: 75,
                    maxRadius: 100);
              }),
              Center(
                child: Observer(builder: (_) {
                  return Text(
                    usuarioStore.usuario?.nome ?? '',
                    style: TextStyle(fontSize: 50),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
