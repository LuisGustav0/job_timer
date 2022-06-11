// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProjectRegisterController on _ProjectRegisterController, Store {
  late final _$storeAtom =
      Atom(name: '_ProjectRegisterController.store', context: context);

  @override
  ProjectRegisterStore get store {
    _$storeAtom.reportRead();
    return super.store;
  }

  @override
  set store(ProjectRegisterStore value) {
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
