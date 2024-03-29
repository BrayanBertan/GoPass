import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/stores/evento_store.dart';
import 'package:gopass_app/views/eventos/componentes/barra_filtros.dart';
import 'package:gopass_app/views/eventos/componentes/eventos_grid.dart';
import 'package:rxdart/rxdart.dart';

EventoStore eventoStore = Modular.get<EventoStore>();
final TextEditingController searchController = TextEditingController();

class EventosPage extends StatefulWidget {
  const EventosPage({Key? key}) : super(key: key);

  @override
  _EventosPageState createState() => _EventosPageState();
}

class _EventosPageState extends State<EventosPage> {
  final searchOnChange = BehaviorSubject<String>();
  void search(String queryString) {
    searchOnChange.add(queryString);
  }

  @override
  void initState() {
    super.initState();
    searchOnChange.debounceTime(Duration(seconds: 1)).listen((queryString) {
      print(queryString);
      eventoStore.setSearch(queryString);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Stack(
        children: [
          !eventoStore.loading
              ? Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: BarraFiltros(
                            searchController, eventoStore, search)),
                    Expanded(flex: 9, child: EventosGrid(eventoStore.eventos)),
                  ],
                )
              : Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                )
        ],
      );
    });
  }
}
