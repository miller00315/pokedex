import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/models/poke_api.dart';
import 'package:pokedex/screens/details/poke_detail_screen.dart';
import 'package:pokedex/screens/homeScreen/widgets/poke_item.dart';
import 'package:provider/provider.dart';
import '../../consts/consts_app.dart';
import '../../stores/poke_api_store.dart';
import './widgets/app_home_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusWidth = MediaQuery.of(context).padding.top;
    final _pokeApiStore = Provider.of<PokeApiStore>(context);

    if (_pokeApiStore.pokeApi == null) _pokeApiStore.fetchPokemonList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: -(240 / 4),
            left: (screenWidth - (240 / 1.6)),
            child: Opacity(
              child: Image.asset(
                ConstsApp.darkPokeball,
                height: 240,
                width: 240,
              ),
              opacity: 0.1,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: statusWidth,
                ),
                AppBarHomeScreen(),
                Expanded(
                  child: Container(
                      child: Observer(builder: (BuildContext context) {
                    return (_pokeApiStore.pokeApi != null)
                        ? AnimationLimiter(
                            child: GridView.builder(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.all(12),
                                addAutomaticKeepAlives: true,
                                gridDelegate:
                                    new SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemCount: _pokeApiStore.pokeApi.pokemon.length,
                                itemBuilder: (context, index) {
                                  Pokemon pokemon =
                                      _pokeApiStore.getPokemon(index: index);
                                  return AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      columnCount: 2,
                                      child: ScaleAnimation(
                                          child: GestureDetector(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: PokeItem(
                                            index: index,
                                            name: pokemon.name,
                                            types: pokemon.type,
                                            image: _pokeApiStore.getImage(
                                                number: pokemon.num),
                                          ),
                                        ),
                                        onTap: () {
                                          _pokeApiStore.setActualPokemon(index: index);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        PokeDetail(
                                                 // index: index,
                                                ),
                                              ));
                                        },
                                      )));
                                }))
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  })
                      // child: ListView(
                      //   children: <Widget>[ListTile(title: Text('Pokemon'))],
                      // )
                      ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
