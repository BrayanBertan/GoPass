import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/models/categoria_model.dart';
import 'package:gopass_app/repositories/evento_repository.dart';
import 'package:gopass_app/stores/evento_store.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'filter_store.g.dart';

class FilterStore = _FilterStore with _$FilterStore;

abstract class _FilterStore with Store {
  _FilterStore({this.dataInicial, this.dataFinal, this.precoMax = 100});

  final helper = Modular.get<EventoRepository>();

  @observable
  DateTime? dataFinal = DateTime.now();

  @action
  void setDataFinal(DateTime value) => dataFinal = value;

  @observable
  double? precoMax = 100;

  @action
  void setPrecoMax(double value) => precoMax = value;

  @observable
  DateTime? dataInicial = DateTime.now();

  @action
  void setDataInicial(DateTime value) => dataInicial = value;

  ObservableList<Categoria>? categoriasList = ObservableList<Categoria>();

  ObservableList<Categoria> categoriasSelecionadasList =
      ObservableList<Categoria>();

  @action
  setCategorias(List lista) {
    categoriasList!.clear();
    lista.forEach((element) => categoriasList!.add(element));
  }

  @action
  setSelecionados(var lista) {
    categoriasSelecionadasList.clear();
    lista.forEach((element) => categoriasSelecionadasList.add(element));
  }

  @action
  getAllCategorias() async {
    List<Categoria> categorias_banco = await helper.getAllCategorias();
    categoriasList!.clear();
    categorias_banco.forEach((element) => categoriasList!.add(element));
  }

  var format = DateFormat('dd/MM/yyyy');
  @computed
  String get formatInicial => format.format(dataInicial ?? DateTime.now());

  @computed
  String get formatFinal => format.format(dataFinal ?? DateTime.now());

  void setFilter() {
    Modular.get<EventoStore>().setFilter(this as FilterStore);
  }

  FilterStore clone() {
    return FilterStore(
        precoMax: precoMax, dataInicial: dataInicial, dataFinal: dataFinal);
  }
}
