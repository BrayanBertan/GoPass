import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/models/categoria_model.dart';
import 'package:gopass_app/models/evento_model.dart';
import 'package:gopass_app/repositories/evento_repository.dart';
import 'package:gopass_app/stores/filter_store.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'evento_store.g.dart';

class EventoStore = _EventoStore with _$EventoStore;

abstract class _EventoStore with Store {
  final eventosRepository = Modular.get<EventoRepository>();
  _EventoStore() {
    loading = false;
    search = '';
    autorun((_) async {
      isLoading(true);
      try {
        final response = await eventosRepository.getAllEvento(search, filter);
        eventos!.addAll(response);

        print('eventos $eventos');
      } catch (error) {
        print(error);
      }
      isLoading(false);
    });
  }

  void reset() {
    nome = '';
    lotacao = RangeValues(100, 200);
    categoria = 1;
    endereco = '';
    descricao = '';
    foto = null;
    preco = 0;
    dataEvento = DateTime.now().subtract(Duration(days: 1));
  }

  @observable
  int abaIndex = 0;

  @action
  void setAbaIndex(int value) => abaIndex = value;

  @observable
  String search = '';

  @action
  void setSearch(String value) {
    eventos!.clear();
    search = value;
  }

  @observable
  FilterStore filter = FilterStore();

  FilterStore get cloneFilter => filter.clone();

  @action
  void setFilter(FilterStore value) {
    eventos!.clear();
    filter = value;
  }

  @observable
  String? nome;

  @observable
  var lotacao = RangeValues(100, 200);

  @observable
  int? categoria;

  @observable
  String? endereco;

  @observable
  String? descricao;

  @observable
  double? preco;

  @observable
  DateTime? dataEvento = DateTime.now().subtract(Duration(days: 7));

  @observable
  ObservableList<Categoria> categorias =
      [Categoria(id: 0, nome: '')].asObservable();

  ObservableList<Evento>? eventos = ObservableList<Evento>();

  @observable
  String? foto;

  @observable
  bool loading = false;

  @action
  isLoading(bool value) => loading = value;

  @observable
  String? error;

  @action
  void setLotacao(RangeValues value) => lotacao = value;

  @action
  void setNome(String value) => nome = value;

  @action
  void setCategoria(int value) => categoria = value;

  @action
  void setEndereco(String value) => endereco = value;

  @action
  void setDescricao(String value) => descricao = value;

  @action
  void setPreco(String value) => preco = double.parse(value);

  @action
  void setData(DateTime value) => dataEvento = value;

  @action
  void setFoto(String value) => foto = value;

  @computed
  bool get nomeValid => nome != null && nome!.length > 6;
  String? get nomeError {
    if (nome == null || nomeValid)
      return null;
    else if (nome!.trim().isEmpty)
      return 'Campo obrigatório';
    else
      return 'Titulo muito curto';
  }

  @computed
  bool get precoValid => preco != null;

  var format = DateFormat('dd/MM/yyyy HH:mm');
  @computed
  String get formartDataEvento => format.format(dataEvento!);

  @computed
  String? get precoError {
    if (preco == null || precoValid)
      return null;
    else
      return 'Campo obrigatório';
  }

  @computed
  bool get enderecoValid => endereco != null;

  @computed
  String? get enderecoError {
    if (endereco == null || enderecoValid)
      return null;
    else
      return 'Campo obrigatório';
  }

  @computed
  bool get descricaoValid => descricao != null;

  @computed
  String? get descricaoError {
    if (descricao == null || descricaoValid)
      return null;
    else
      return 'Campo obrigatório';
  }

  @computed
  bool get isFormValid =>
      nomeValid && enderecoValid && descricaoValid && precoValid;

  @action
  getAllCategorias() async {
    List<Categoria> categorias_banco =
        await eventosRepository.getAllCategorias();
    categorias.clear();
    categorias_banco.forEach((element) => categorias.add(element));
  }

  @action
  Future<void> cadastro() async {
    try {
      var retorno = await eventosRepository.saveEvento(Evento(
          nome: nome,
          categoria_id: categoria,
          data_evento: dataEvento,
          endereco: endereco,
          lotacao_maxima: lotacao.end.toInt(),
          lotacao_minima: lotacao.start.toInt(),
          usuario_id: 1,
          valor: preco,
          foto: foto));
      reset();
    } catch (e) {
      print(e);
    }
  }
}
