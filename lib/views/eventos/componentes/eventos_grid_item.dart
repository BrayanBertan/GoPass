import 'package:flutter/material.dart';

class EventosGridItem extends StatefulWidget {
  const EventosGridItem({Key? key}) : super(key: key);

  @override
  _EventosGridItemState createState() => _EventosGridItemState();
}

class _EventosGridItemState extends State<EventosGridItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 8,
        child: Scaffold(
          bottomNavigationBar:
              ElevatedButton(onPressed: () {}, child: Text('Comprar')),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Image.network(
                    'https://www.jambase.com/wp-content/uploads/2019/10/dir-en-grey-ticketmaster-ram.jpg',
                    fit: BoxFit.fill,
                    height: 125,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: new BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                          )),
                      margin: const EdgeInsets.only(left: 0),
                      child: Center(
                        child: Text(
                          '25/10/2021',
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                'Dir en Grey',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ListTile(
                        minLeadingWidth: 10,
                        leading: Image.asset(
                          'assets/images/location.png',
                          width: 25,
                          height: 25,
                        ),
                        title: Text(
                          'Lorem ipsum dolor sit amet.Lorem ipsum dolor sit ametLorem ipsum dolor sit amet',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
