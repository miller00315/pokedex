import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import '../models/poke_api.dart';
import '../consts/consts_api.dart';
part 'poke_api_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  
  @observable
  PokeAPI _pokeApi;

  @computed
  PokeAPI get pokeApi => _pokeApi;

  @observable
  Pokemon _actualPokemon;

  @observable
  dynamic  _pokemonActualColor;

  @action
  fetchPokemonList() {
    
    _pokeApi = null;

    loadPokeApi()
      .then((pokeList) {
        _pokeApi = pokeList;
      });
  }

  @action
  Pokemon getPokemon({int index}) {
    return _pokeApi.pokemon[index];
  }

  @action
  setActualPokemon({int index}) {
    print(index);
    _actualPokemon = _pokeApi.pokemon[index];
    _pokemonActualColor = ConstsAPI.getColorType(type: _actualPokemon.type[0]);
  }

  @computed
  Pokemon get getAtualPokemon => _actualPokemon;

  @computed
  get actualPokemonColor => _pokemonActualColor;

  @action
  Widget getImage({String number}) {
    return loadImage(number: number);
  }

  @action
  Color getColorType({String type}) {
    return ConstsAPI.getColorType(type: type);
  }

  Future<PokeAPI> loadPokeApi() async {
    try {
      final response = await http.get(ConstsAPI.pokeapiURL);
      var decodeJson = jsonDecode(response.body);
      return PokeAPI.fromJson(decodeJson);
    } catch(e) {
      print("Erro na lista");
      return null;
    }
  }

  Widget loadImage({String number}) {
    return CachedNetworkImage(
      height: 80,
      width: 80,
      placeholder: (context, url) => Container(
        child: CircularProgressIndicator(),
      ),
      imageUrl:
        'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$number.png',
    );
  }
}