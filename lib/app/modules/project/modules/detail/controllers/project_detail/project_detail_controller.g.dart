// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProjectDetailController on _ProjectDetailController, Store {
  late final _$storeAtom =
      Atom(name: '_ProjectDetailController.store', context: context);

  @override
  ProjectDetailStore get store {
    _$storeAtom.reportRead();
    return super.store;
  }

  @override
  set store(ProjectDetailStore value) {
    _$storeAtom.reportWrite(value, super.store, () {
      super.store = value;
    });
  }

  late final _$updateProjectAsyncAction =
      AsyncAction('_ProjectDetailController.updateProject', context: context);

  @override
  Future<void> updateProject() {
    return _$updateProjectAsyncAction.run(() => super.updateProject());
  }

  late final _$finishProjectAsyncAction =
      AsyncAction('_ProjectDetailController.finishProject', context: context);

  @override
  Future<void> finishProject() {
    return _$finishProjectAsyncAction.run(() => super.finishProject());
  }

  late final _$_ProjectDetailControllerActionController =
      ActionController(name: '_ProjectDetailController', context: context);

  @override
  void setProjectModel(ProjectModel? projectModel) {
    final _$actionInfo = _$_ProjectDetailControllerActionController.startAction(
        name: '_ProjectDetailController.setProjectModel');
    try {
      return super.setProjectModel(projectModel);
    } finally {
      _$_ProjectDetailControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
store: ${store}
    ''';
  }
}
