import 'package:flutter/material.dart';

class AppBarHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 12, right: 5),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu),
              ),
            )
          ]),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Pokedex',
              style: TextStyle(
                  fontFamily: 'Google',
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
          ),
        ])
      ]),
      height: 120,
      //color: (Color.fromARGB(200, 240, 245, 210)),
    );
  }
}
