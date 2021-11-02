import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/models/reserva_model.dart';
import 'package:gopass_app/repositories/reserva_repository.dart';
import 'package:mobx/mobx.dart';

part 'reserva_store.g.dart';

class ReservaStore = _ReservaStore with _$ReservaStore;

abstract class _ReservaStore with Store {
  final reservaRepository = Modular.get<ReservaRepository>();
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

  @action
  setAssentosSelecionados(int assento) {
    if (assentosSelecionados.contains(assento))
      assentosSelecionados.remove(assento);
    else
      assentosSelecionados.add(assento);
  }

  int numeroGrid(int lotacao) {
    return ((lotacao / 12) % 2 == 0)
        ? (lotacao + int.parse((lotacao / 12).toStringAsFixed(0)) + 1)
        : (lotacao + int.parse((lotacao / 12).toStringAsFixed(0)) + 2);
  }

  void Reservar() {
    reservaRepository.saveReserva(Reserva(
        usuario_id: 2,
        assento_id: 15,
        confirmada: 0,
        data_reserva: DateTime.now(),
        evento_id: 1,
        modo_pagamento: 'boleto'));
  }

  @action
  Future<void> getAllReservaS(int evento) async {
    assentosSelecionados.clear();
    var retorno = await reservaRepository.getAllReserva(evento);
    reservasAssento.clear();
    retorno.forEach((element) {
      reservas.add(element);
      reservasAssento.add(element.assento_id!);
    });
    print('reservas $reservasAssento');
    print('contains ${reservasAssento.contains(15)}');
  }
}
