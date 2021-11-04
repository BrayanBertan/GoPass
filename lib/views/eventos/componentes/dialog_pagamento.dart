import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/models/reserva_model.dart';

class DialogPagamento extends StatefulWidget {
  Reserva reserva;
  var reservaStore;
  DialogPagamento(this.reserva, this.reservaStore);

  @override
  _DialogPagamentoState createState() =>
      _DialogPagamentoState(this.reserva, this.reservaStore);
}

class _DialogPagamentoState extends State<DialogPagamento> {
  Reserva reserva;
  var reservaStore;
  _DialogPagamentoState(this.reserva, this.reservaStore);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      padding: EdgeInsets.all(5),
      width: 1000,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Pagamento',
            style: TextStyle(fontSize: 25),
          ),
          ListTile(
            leading: Image.asset('assets/images/preco.png'),
            title: Text(
                '${reserva.qtde_ingressos!}x${reserva.valor!.toStringAsFixed(2)} -> R\$ ${(reserva.valor! * reserva.qtde_ingressos!).toStringAsFixed(2)}'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  reservaStore.setModoDePagamento(0);
                },
                child: Observer(
                  builder: (_) {
                    return Container(
                      padding: EdgeInsets.all(1),
                      width: 75,
                      height: 115,
                      decoration: BoxDecoration(
                          color: reservaStore.modoDePagamento == 0
                              ? Colors.blue
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Image.asset('assets/images/credito.png'),
                          Text('Cartão de credito')
                        ],
                      ),
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  reservaStore.setModoDePagamento(1);
                },
                child: Observer(
                  builder: (_) {
                    return Container(
                      padding: EdgeInsets.all(1),
                      width: 75,
                      height: 115,
                      decoration: BoxDecoration(
                          color: reservaStore.modoDePagamento == 1
                              ? Colors.blue
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Image.asset('assets/images/debito.png'),
                          Text('Cartão de debito')
                        ],
                      ),
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  reservaStore.setModoDePagamento(2);
                },
                child: Observer(
                  builder: (_) {
                    return Container(
                      padding: EdgeInsets.all(1),
                      width: 75,
                      height: 115,
                      decoration: BoxDecoration(
                          color: reservaStore.modoDePagamento == 2
                              ? Colors.blue
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Image.asset('assets/images/pix.png'),
                          Text('pix')
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Observer(builder: (_) {
              return ElevatedButton(
                onPressed: () {
                  Modular.to.pop(1);
                },
                child: const Text(
                  'Pagar',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              );
            }),
          )
        ],
      ),
    ));
  }
}
