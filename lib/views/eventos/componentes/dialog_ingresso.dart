import 'package:flutter/material.dart';
import 'package:gopass_app/models/reserva_model.dart';

class DialogIngresso extends StatelessWidget {
  Reserva reserva;
  String assento;
  DialogIngresso(this.reserva, this.assento);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      padding: EdgeInsets.all(35),
      width: 500,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/qr.png'),
          Text(
            '${reserva.evento!} - assento $assento',
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    ));
  }
}
