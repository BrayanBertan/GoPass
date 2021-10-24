import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class DialogFiltros extends StatefulWidget {
  const DialogFiltros({Key? key}) : super(key: key);

  @override
  _DialogFiltrosState createState() => _DialogFiltrosState();
}

class _DialogFiltrosState extends State<DialogFiltros> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 500,
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Filtros',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            Observer(builder: (_) {
              return ListTile(
                leading: Text(
                  'Preço máximo',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                title: Slider(
                  value: 5,
                  min: 0,
                  max: 300,
                  onChanged: (double value) {},
                  label: 's',
                  divisions: 50,
                  activeColor: Color.fromRGBO(203, 100, 100, 1),
                ),
                trailing: Wrap(
                  spacing: 2,
                  runSpacing: 2,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Image.asset(
                        'assets/images/preco.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text('23'),
                  ],
                ),
              );
            }),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(child: Observer(builder: (_) {
                  return GestureDetector(
                    onTap: () async {
                      var a = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        locale: const Locale("pt"),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Wrap(
                          children: [Text('Dt. Inicial'), Text('23/06/1998')],
                        ),
                        leading: Image.asset('assets/images/calendar.png'),
                      ),
                    ),
                  );
                })),
                Expanded(child: Observer(builder: (_) {
                  return GestureDetector(
                    onTap: () async {
                      var a = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        locale: const Locale("pt"),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Wrap(
                          children: [Text('Dt. Final'), Text('23/06/1998')],
                        ),
                        leading: Image.asset('assets/images/calendar.png'),
                      ),
                    ),
                  );
                })),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Observer(builder: (_) {
              return MultiSelectDialogField(
                title: Text('Categorias'),
                buttonText: Text('Eventos'),
                items: [],
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {},
              );
            }),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(203, 100, 100, 1),
                ),
                onPressed: () {
                  Modular.to.pop();
                },
                child: Text('Filtrar')),
          ],
        ),
      ),
    );
  }
}
