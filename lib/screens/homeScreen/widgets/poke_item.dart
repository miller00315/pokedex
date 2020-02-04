import 'package:flutter/material.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/consts/consts_app.dart';

class PokeItem extends StatelessWidget {
  final String name;
  final int index;
  final Color color;
  final Widget image;
  final List<String> types;

  const PokeItem(
      {Key key,
      @required this.name,
      @required this.index,
      this.types,
      this.color,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        child: Stack(
          children: <Widget>[
            Stack(alignment: Alignment.bottomRight, children: <Widget>[
              Opacity(
                child: Image.asset(
                  ConstsApp.whitePokeball,
                  height: 80,
                  width: 80,
                ),
                opacity: 0.2,
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: image,
                  )),
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: Text(
                    this.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Google',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: setTypes(),
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: ConstsAPI.getColorType(type: types[0]),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            )),
      ),
    );
  }

   Widget setTypes() {
    List<Widget> list = [];
    types.forEach((name) {
      list.add(
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(80, 255, 255, 255)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  name.trim(),
                  style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      );
    });
    return Column(
      children: list,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

}
