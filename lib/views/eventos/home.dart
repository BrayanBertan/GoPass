import 'package:flutter/material.dart';
import 'package:gopass_app/views/eventos/componentes/barra_filtros.dart';
import 'package:gopass_app/views/eventos/componentes/bottom_menu_cliente.dart';
import 'package:gopass_app/views/eventos/componentes/eventos_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomMenuCliente(),
      body: SingleChildScrollView(
        child: Column(
          children: [BarraFiltros(), EventosGrid()],
        ),
      ),
    );
  }
}
