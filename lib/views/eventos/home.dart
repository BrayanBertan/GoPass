import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/stores/evento_store.dart';
import 'package:gopass_app/views/eventos/componentes/barra_filtros.dart';
import 'package:gopass_app/views/eventos/componentes/bottom_menu_cliente.dart';
import 'package:gopass_app/views/eventos/componentes/eventos_grid.dart';

EventoStore eventoStore = Modular.get<EventoStore>();
final TextEditingController searchController = TextEditingController();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    eventoStore.getAllEventos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomMenuCliente(),
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) {
            return Stack(
              children: [
                !eventoStore.loading
                    ? Column(
                        children: [
                          BarraFiltros(searchController, eventoStore),
                          EventosGrid(eventoStore.eventos),
                        ],
                      )
                    : Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      )
              ],
            );
          },
        ),
      ),
    );
  }
}
