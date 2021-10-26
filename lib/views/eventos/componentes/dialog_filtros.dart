import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/models/categoria_model.dart';
import 'package:gopass_app/stores/filter_store.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class DialogFiltros extends StatefulWidget {
  const DialogFiltros({Key? key}) : super(key: key);

  @override
  _DialogFiltrosState createState() => _DialogFiltrosState();
}

class _DialogFiltrosState extends State<DialogFiltros> {
  FilterStore filterStore = Modular.get<FilterStore>().clone();

  @override
  void initState() {
    filterStore.getAllCategorias();
    super.initState();
  }

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
                  value: filterStore.precoMax ?? 50,
                  min: 0,
                  max: 300,
                  onChanged: (double value) {
                    filterStore.setPrecoMax(value);
                  },
                  label: filterStore.precoMax?.toStringAsFixed(2) ?? '',
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
                    Text(filterStore.precoMax?.toStringAsFixed(2) ?? ''),
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
                      filterStore.dataInicial = await showDatePicker(
                        context: context,
                        initialDate:
                            DateTime.now().subtract(Duration(days: 11)),
                        firstDate: DateTime.now().subtract(Duration(days: 11)),
                        lastDate: DateTime.now().add(Duration(days: 60)),
                        locale: const Locale("pt"),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Wrap(
                          children: [
                            Text('Dt. Inicial'),
                            Text(filterStore.formatInicial)
                          ],
                        ),
                        leading: Image.asset('assets/images/calendar.png'),
                      ),
                    ),
                  );
                })),
                Expanded(child: Observer(builder: (_) {
                  return GestureDetector(
                    onTap: () async {
                      filterStore.dataFinal = await showDatePicker(
                        context: context,
                        initialDate: filterStore.dataInicial!,
                        firstDate: filterStore.dataInicial!,
                        lastDate:
                            filterStore.dataInicial!.add(Duration(days: 60)),
                        locale: const Locale("pt"),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Wrap(
                          children: [
                            Text('Dt. Final'),
                            Text(filterStore.formatFinal)
                          ],
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
                initialValue: filterStore.categoriasSelecionadasList,
                onConfirm: (itens) => filterStore.setSelecionados,
                title: Text('Categorias'),
                buttonText: Text('Eventos'),
                items: filterStore.categoriasList!
                    .map((categoria) =>
                        MultiSelectItem<Categoria?>(categoria, categoria.nome!))
                    .toList(),
                listType: MultiSelectListType.CHIP,
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
                  filterStore.setFilter();
                  Modular.to.pop();
                },
                child: Text('Filtrar')),
          ],
        ),
      ),
    );
  }
}
