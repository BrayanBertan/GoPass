import 'package:flutter/material.dart';
import 'package:gopass_app/views/eventos/componentes/eventos_grid_item.dart';

class EventosGrid extends StatefulWidget {
  const EventosGrid({Key? key}) : super(key: key);

  @override
  _EventosGridState createState() => _EventosGridState();
}

class _EventosGridState extends State<EventosGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisExtent: 300,
          maxCrossAxisExtent: 400,
          crossAxisSpacing: 1,
          mainAxisSpacing: 3,
          childAspectRatio: 1),
      itemBuilder: (context, index) {
        return EventosGridItem();
      },
    );
  }
}
