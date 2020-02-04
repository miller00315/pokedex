// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_api_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on _PokeApiStoreBase, Store {
  Computed<PokeAPI> _$pokeApiComputed;

  @override
  PokeAPI get pokeApi =>
      (_$pokeApiComputed ??= Computed<PokeAPI>(() => super.pokeApi)).value;
  Computed<Pokemon> _$getAtualPokemonComputed;

  @override
  Pokemon get getAtualPokemon => (_$getAtualPokemonComputed ??=
          Computed<Pokemon>(() => super.getAtualPokemon))
      .value;
  Computed<dynamic> _$actualPokemonColorComputed;

  @override
  dynamic get actualPokemonColor => (_$actualPokemonColorComputed ??=
          Computed<dynamic>(() => super.actualPokemonColor))
      .value;

  final _$_pokeApiAtom = Atom(name: '_PokeApiStoreBase._pokeApi');

  @override
  PokeAPI get _pokeApi {
    _$_pokeApiAtom.context.enforceReadPolicy(_$_pokeApiAtom);
    _$_pokeApiAtom.reportObserved();
    return super._pokeApi;
  }

  @override
  set _pokeApi(PokeAPI value) {
    _$_pokeApiAtom.context.conditionallyRunInAction(() {
      super._pokeApi = value;
      _$_pokeApiAtom.reportChanged();
    }, _$_pokeApiAtom, name: '${_$_pokeApiAtom.name}_set');
  }

  final _$_actualPokemonAtom = Atom(name: '_PokeApiStoreBase._actualPokemon');

  @override
  Pokemon get _actualPokemon {
    _$_actualPokemonAtom.context.enforceReadPolicy(_$_actualPokemonAtom);
    _$_actualPokemonAtom.reportObserved();
    return super._actualPokemon;
  }

  @override
  set _actualPokemon(Pokemon value) {
    _$_actualPokemonAtom.context.conditionallyRunInAction(() {
      super._actualPokemon = value;
      _$_actualPokemonAtom.reportChanged();
    }, _$_actualPokemonAtom, name: '${_$_actualPokemonAtom.name}_set');
  }

  final _$_pokemonActualColorAtom =
      Atom(name: '_PokeApiStoreBase._pokemonActualColor');

  @override
  dynamic get _pokemonActualColor {
    _$_pokemonActualColorAtom.context
        .enforceReadPolicy(_$_pokemonActualColorAtom);
    _$_pokemonActualColorAtom.reportObserved();
    return super._pokemonActualColor;
  }

  @override
  set _pokemonActualColor(dynamic value) {
    _$_pokemonActualColorAtom.context.conditionallyRunInAction(() {
      super._pokemonActualColor = value;
      _$_pokemonActualColorAtom.reportChanged();
    }, _$_pokemonActualColorAtom,
        name: '${_$_pokemonActualColorAtom.name}_set');
  }

  final _$_PokeApiStoreBaseActionController =
      ActionController(name: '_PokeApiStoreBase');

  @override
  dynamic fetchPokemonList() {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Pokemon getPokemon({int index}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.getPokemon(index: index);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setActualPokemon({int index}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.setActualPokemon(index: index);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget getImage({String number}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.getImage(number: number);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Color getColorType({String type}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.getColorType(type: type);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
