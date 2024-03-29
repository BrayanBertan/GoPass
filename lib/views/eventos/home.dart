import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/models/evento_model.dart';
import 'package:gopass_app/stores/evento_store.dart';
import 'package:gopass_app/stores/usuario_store.dart';
import 'package:gopass_app/views/cadastro/cadastro_view.dart';
import 'package:gopass_app/views/eventos/cadastro_view.dart';
import 'package:gopass_app/views/eventos/componentes/bottom_menu_admin.dart';
import 'package:gopass_app/views/eventos/componentes/bottom_menu_cliente.dart';
import 'package:gopass_app/views/eventos/eventos_view.dart';
import 'package:gopass_app/views/eventos/meus_eventos.dart';

EventoStore eventoStore = Modular.get<EventoStore>();
UsuarioStore usuarioStore = Modular.get<UsuarioStore>();
final TextEditingController searchController = TextEditingController();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _telasCliente = [
    EventosPage(),
    MeusEventosPage(),
    CadastroPage()
  ];

  final List<Widget> _telasAdmin = [EventosPage(), EventoCadastroPage()];

  void abaSelecionada(int aba) {
    if (aba == 1)
      eventoStore.setEvento(Evento(
          nome: '',
          foto: null,
          categoria_id: 1,
          data_evento: DateTime.now().add(Duration(days: 5)),
          endereco: '',
          lotacao_maxima: 200,
          lotacao_minima: 100,
          usuario_id: 1,
          valor: 0)
        ..id = null);
    eventoStore.setAbaIndex(aba);
  }

  @override
  void initState() {
    abaSelecionada(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(3, 155, 229, 1),
          leading: IconButton(
            onPressed: () {
              usuarioStore.logout();
              Modular.to.pushReplacementNamed('/login');
            },
            icon: const Icon(Icons.logout),
          ),
        ),
        bottomNavigationBar:
            (usuarioStore.usuario == null || usuarioStore.usuario!.tipo == 'C')
                ? BottomMenuCliente(abaSelecionada, eventoStore.abaIndex)
                : BottomMenuAdmin(abaSelecionada, eventoStore.abaIndex),
        body:
            (usuarioStore.usuario == null || usuarioStore.usuario!.tipo == 'C')
                ? _telasCliente[eventoStore.abaIndex]
                : _telasAdmin[eventoStore.abaIndex],
      );
    });
  }
}
