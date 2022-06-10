// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProjectRegisterStore on _ProjectRegisterStore, Store {
  late final _$statusEAtom =
      Atom(name: '_ProjectRegisterStore.statusE', context: context);

  @override
  ProjectRegisterStatusE get statusE {
    _$statusEAtom.reportRead();
    return super.statusE;
  }

  @override
  set statusE(ProjectRegisterStatusE value) {
    _$statusEAtom.reportWrite(value, super.statusE, () {
      super.statusE = value;
    });
  }

  late final _$_ProjectRegisterStoreActionController =
      ActionController(name: '_ProjectRegisterStore', context: context);

  @override
  void onChangeStatus(ProjectRegisterStatusE status, {String? errorMessage}) {
    final _$actionInfo = _$_ProjectRegisterStoreActionController.startAction(
        name: '_ProjectRegisterStore.onChangeStatus');
    try {
      return super.onChangeStatus(status, errorMessage: errorMessage);
    } finally {
      _$_ProjectRegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
statusE: ${statusE}
    ''';
  }
}
