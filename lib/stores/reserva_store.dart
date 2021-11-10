import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/models/assento_model.dart';
import 'package:gopass_app/models/evento_model.dart';
import 'package:gopass_app/models/grafico_model.dart';
import 'package:gopass_app/models/reserva_model.dart';
import 'package:gopass_app/repositories/evento_repository.dart';
import 'package:gopass_app/repositories/reserva_repository.dart';
import 'package:gopass_app/stores/usuario_store.dart';
import 'package:mobx/mobx.dart';

part 'reserva_store.g.dart';

class ReservaStore = _ReservaStore with _$ReservaStore;

abstract class _ReservaStore with Store {
  final reservaRepository = Modular.get<ReservaRepository>();
  final eventoRepository = Modular.get<EventoRepository>();
  final usuarioStore = Modular.get<UsuarioStore>();
  List<String> alfabeto = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  @observable
  int alfabetoIndex = -1;

  @observable
  ObservableList<Reserva> reservas = ObservableList<Reserva>();
  @observable
  ObservableList<int> reservasAssento = ObservableList<int>();

  @observable
  ObservableList<int> assentosSelecionados = ObservableList<int>();

  @observable
  ObservableList<Map<String, dynamic>> teste =
      ObservableList<Map<String, dynamic>>();

  bool checkAssento(int assento) {
    for (var map in teste) {
      if (map.containsKey("assento")) {
        if (map["assento"] == assento) {
          return true;
        }
      }
    }
    return false;
  }

  @action
  setAssentosSelecionados(int assento, String linha) {
    print(linha);
    if (assentosSelecionados.contains(assento)) {
      assentosSelecionados.remove(assento);
      teste.removeWhere((element) => element['assento'] == assento);
    } else {
      assentosSelecionados.add(assento);
      teste.add({'linha': linha, 'assento': assento});
    }
  }

  int numeroGrid(int lotacao) {
    return ((lotacao / 12) % 2 == 0)
        ? (lotacao + int.parse((lotacao / 12).toStringAsFixed(0)) + 1)
        : (lotacao + int.parse((lotacao / 12).toStringAsFixed(0)) + 2);
  }

  Future<void> Reservar() async {
    reservaRepository.saveReserva(
        Reserva(
            usuario_id: Modular.get<UsuarioStore>().usuario!.id,
            confirmada: 0,
            data_reserva: DateTime.now(),
            evento_id: 1,
            modo_pagamento: 'boleto'),
        teste);
  }

  @observable
  ObservableList<Assento> assentosReservaAtual = ObservableList<Assento>();

  Future<void> getAllAssentosReserva(int id) async {
    try {
      //loading = true;
      var retorno = await reservaRepository.getAllAssentos(id);
      assentosReservaAtual.clear();
      assentosReservaAtual.addAll(retorno);
      // loading = false;
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> getAllReservaS(int evento) async {
    assentosSelecionados.clear();
    var retorno = await reservaRepository.getAllReserva(evento);
    reservasAssento.clear();
    reservasAssento.addAll(retorno);
    print(reservasAssento);
  }

  @observable
  ObservableList<Reserva> reservasUsuario = ObservableList<Reserva>();

  @action
  Future<void> getAllReservasUsuario() async {
    try {
      loading = true;
      var retorno = await reservaRepository
          .getAllReservasUsuario(usuarioStore.usuario!.id!);
      reservasUsuario.clear();
      reservasUsuario.addAll(retorno);
      loading = false;
    } catch (e) {
      print(e);
    }
  }

  @observable
  ObservableList<GraficoBarra> grafico = ObservableList<GraficoBarra>();

  @observable
  int quantidade = 0;
  @action
  addQuantidade(int qtd) => quantidade += qtd;

  @observable
  int quantidadeConfirmado = 0;
  @action
  addQuantidadeConfirmado(int qtd) => quantidadeConfirmado += qtd;

  @observable
  int quantidadePendente = 0;
  @action
  addQuantidadePendente(int qtd) => quantidadePendente += qtd;

  @observable
  int quantidadeCancelado = 0;
  @action
  addQuantidadeCancelado(int qtd) => quantidadeCancelado += qtd;

  @action
  resetaQuantidade() {
    quantidade = 0;
    quantidadeCancelado = 0;
    quantidadeConfirmado = 0;
    quantidadePendente = 0;
  }

  @action
  Future<void> getGrafico(int id) async {
    try {
      loading = true;
      var retorno = await reservaRepository.getGrafico(id);
      grafico.clear();
      resetaQuantidade();
      grafico.addAll(retorno);
      grafico.forEach((element) {
        print(element.eixoX);
        addQuantidade(element.eixoY!);
        switch (element.eixoX) {
          case 'pendente':
            return addQuantidadePendente(element.eixoY!);
          case 'confirmado':
            return addQuantidadeConfirmado(element.eixoY!);
          default:
            return addQuantidadeCancelado(element.eixoY!);
        }
      });
      loading = false;
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> reservaStatus(DateTime reserva, int status) {
    if (status == 1)
      return {'status': 'Confirmado', 'color': Colors.green};
    else if (DateTime.now().difference(reserva).inHours >= 24)
      return {'status': 'Cancelado', 'color': Colors.grey};
    else
      return {'status': 'Pendente', 'color': Colors.yellow};
  }

  @computed
  bool get isValid => assentosSelecionados.isNotEmpty;

  late double preco;

  @computed
  double get valorTotalReserva => assentosSelecionados.length * preco;

  @observable
  bool loading = false;

  @action
  void isLoading(bool value) => loading = value;

  @observable
  bool loadingPagamento = false;

  @action
  void isLoadingPagamento(bool value) => loadingPagamento = value;

  Future<Evento>? getEvento(int id) async {
    var evento = await eventoRepository.getEvento(id);
    return evento!;
  }

  List<String> modos_pagamento = [
    'Cartão de crédito',
    'Cartão de debito',
    'Pix'
  ];
  Future<void> updatePagamento(Reserva reserva) async {
    reserva.modo_pagamento = modos_pagamento[modoDePagamento];
    print('reservaaa ${reserva.modo_pagamento}');
    print('reservaaa ${reserva.confirmada}');
    var evento = await reservaRepository.updateReserva(reserva);
  }

  @observable
  int modoDePagamento = 0;

  @action
  void setModoDePagamento(int value) => modoDePagamento = value;
}
