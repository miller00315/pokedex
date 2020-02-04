import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/models/poke_api.dart';
import 'package:pokedex/stores/poke_api_store.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokeDetail extends StatelessWidget {
  final int index;

  PokeDetail({this.index});

  @override
  Widget build(BuildContext context) {
    final _pokeApiStore = Provider.of<PokeApiStore>(context);

    //Pokemon _pokemon = _pokeApiStore.actualPokemon;

    //final _pokemonColor = ConstsAPI.getColorType(type: _pokemon.type[0]);

    return (Scaffold(
      appBar: PreferredSize(
        child: Observer(
            builder: (BuildContext context) => AppBar(
                  title: Opacity(
                    child: Text(_pokeApiStore.getAtualPokemon.name,
                        style: TextStyle(
                          fontFamily: 'Google',
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        )),
                    opacity: 1,
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    )
                  ],
                  elevation: 0,
                  backgroundColor: _pokeApiStore.actualPokemonColor,
                )),
        preferredSize: Size.fromHeight(50),
      ),
      body: Stack(children: <Widget>[
        Observer(
            builder: (BuildContext context) => Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: _pokeApiStore.actualPokemonColor as Color,
                )),
        Container(
          height: MediaQuery.of(context).size.height / 1.4,
          color: Colors.transparent,
        ),
        SlidingSheet(
            elevation: 0,
            cornerRadius: 16,
            snapSpec: SnapSpec(
              snap: true,
              snappings: [0.4, 0.7, 1.0],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Container(
                height: MediaQuery.of(context).size.height,
              );
            }),
        Padding(
          child: SizedBox(
            height: 150,
            child: Observer(
              builder: (BuildContext context) {
                return (PageView.builder(
                    onPageChanged: (index) {
                      _pokeApiStore.setActualPokemon(index: index);
                    },
                    itemCount: _pokeApiStore.pokeApi.pokemon.length,
                    itemBuilder: (BuildContext contex, int index) {
                      return _pokeApiStore.getImage(
                          number: _pokeApiStore
                              .getPokemon(index: index)
                              .num
                              .toString());
                    }));
              },
            ),
          ),
          padding: EdgeInsets.only(top: 25),
        )
      ]),
    ));
  }
}
