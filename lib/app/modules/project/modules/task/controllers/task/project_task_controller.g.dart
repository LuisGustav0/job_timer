// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_task_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProjectTaskController on _ProjectTaskController, Store {
  late final _$storeAtom =
      Atom(name: '_ProjectTaskController.store', context: context);

  @override
  ProjectTaskStore get store {
    _$storeAtom.reportRead();
    return super.store;
  }

  @override
  set store(ProjectTaskStore value) {
    _$storeAtom.reportWrite(value, super.store, () {
      super.store = value;
    });
  }

  late final _$_ProjectTaskControllerActionController =
      ActionController(name: '_ProjectTaskController', context: context);

  @override
  void setProjectModel(ProjectModel? projectModel) {
    final _$actionInfo = _$_ProjectTaskControllerActionController.startAction(
        name: '_ProjectTaskController.setProjectModel');
    try {
      return super.setProjectModel(projectModel);
    } finally {
      _$_ProjectTaskControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
store: ${store}
    ''';
  }
}
