// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginState on _LoginState, Store {
  late final _$statusEAtom =
      Atom(name: '_LoginState.statusE', context: context);

  @override
  LoginStatusE get statusE {
    _$statusEAtom.reportRead();
    return super.statusE;
  }

  @override
  set statusE(LoginStatusE value) {
    _$statusEAtom.reportWrite(value, super.statusE, () {
      super.statusE = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_LoginState.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$_LoginStateActionController =
      ActionController(name: '_LoginState', context: context);

  @override
  void copyWith({required LoginStatusE status, String? errorMessage}) {
    final _$actionInfo =
        _$_LoginStateActionController.startAction(name: '_LoginState.copyWith');
    try {
      return super.copyWith(status: status, errorMessage: errorMessage);
    } finally {
      _$_LoginStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
statusE: ${statusE},
errorMessage: ${errorMessage}
    ''';
  }
}
