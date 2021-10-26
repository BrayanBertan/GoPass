import 'package:flutter/material.dart';
import 'package:gopass_app/views/eventos/componentes/eventos_grid_item.dart';

class EventosGrid extends StatefulWidget {
  var eventos;
  EventosGrid(this.eventos);
  @override
  _EventosGridState createState() => _EventosGridState(this.eventos);
}

class _EventosGridState extends State<EventosGrid> {
  var eventos;
  _EventosGridState(this.eventos);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      itemCount: this.eventos.length ?? 0,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisExtent: 300,
          maxCrossAxisExtent: 400,
          crossAxisSpacing: 1,
          mainAxisSpacing: 3,
          childAspectRatio: 1),
      itemBuilder: (context, index) {
        return EventosGridItem(index: this.eventos[index]);
      },
    );
  }
}
