// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProjectDetailStore on _ProjectDetailStore, Store {
  late final _$statusEAtom =
      Atom(name: '_ProjectDetailStore.statusE', context: context);

  @override
  ProjectDetailStatusE get statusE {
    _$statusEAtom.reportRead();
    return super.statusE;
  }

  @override
  set statusE(ProjectDetailStatusE value) {
    _$statusEAtom.reportWrite(value, super.statusE, () {
      super.statusE = value;
    });
  }

  late final _$projectModelAtom =
      Atom(name: '_ProjectDetailStore.projectModel', context: context);

  @override
  ProjectModel? get projectModel {
    _$projectModelAtom.reportRead();
    return super.projectModel;
  }

  @override
  set projectModel(ProjectModel? value) {
    _$projectModelAtom.reportWrite(value, super.projectModel, () {
      super.projectModel = value;
    });
  }

  late final _$_ProjectDetailStoreActionController =
      ActionController(name: '_ProjectDetailStore', context: context);

  @override
  void emit({ProjectDetailStatusE? statusE, ProjectModel? projectModel}) {
    final _$actionInfo = _$_ProjectDetailStoreActionController.startAction(
        name: '_ProjectDetailStore.emit');
    try {
      return super.emit(statusE: statusE, projectModel: projectModel);
    } finally {
      _$_ProjectDetailStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
statusE: ${statusE},
projectModel: ${projectModel}
    ''';
  }
}
