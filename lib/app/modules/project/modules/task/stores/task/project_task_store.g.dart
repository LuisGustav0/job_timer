// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProjectTaskStore on _ProjectTaskStore, Store {
  late final _$statusEAtom =
      Atom(name: '_ProjectTaskStore.statusE', context: context);

  @override
  ProjectTaskStatusE get statusE {
    _$statusEAtom.reportRead();
    return super.statusE;
  }

  @override
  set statusE(ProjectTaskStatusE value) {
    _$statusEAtom.reportWrite(value, super.statusE, () {
      super.statusE = value;
    });
  }

  late final _$_ProjectTaskStoreActionController =
      ActionController(name: '_ProjectTaskStore', context: context);

  @override
  void emit({ProjectTaskStatusE? statusE}) {
    final _$actionInfo = _$_ProjectTaskStoreActionController.startAction(
        name: '_ProjectTaskStore.emit');
    try {
      return super.emit(statusE: statusE);
    } finally {
      _$_ProjectTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
statusE: ${statusE}
    ''';
  }
}
