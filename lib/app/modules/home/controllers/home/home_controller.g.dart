// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  late final _$storeAtom =
      Atom(name: '_HomeController.store', context: context);

  @override
  HomeStore get store {
    _$storeAtom.reportRead();
    return super.store;
  }

  @override
  set store(HomeStore value) {
    _$storeAtom.reportWrite(value, super.store, () {
      super.store = value;
    });
  }

  @override
  String toString() {
    return '''
store: ${store}
    ''';
  }
}