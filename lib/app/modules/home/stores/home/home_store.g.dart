// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$listProjectAtom =
      Atom(name: '_HomeStore.listProject', context: context);

  @override
  List<ProjectModel> get listProject {
    _$listProjectAtom.reportRead();
    return super.listProject;
  }

  @override
  set listProject(List<ProjectModel> value) {
    _$listProjectAtom.reportWrite(value, super.listProject, () {
      super.listProject = value;
    });
  }

  late final _$statusEAtom = Atom(name: '_HomeStore.statusE', context: context);

  @override
  HomeStatusE get statusE {
    _$statusEAtom.reportRead();
    return super.statusE;
  }

  @override
  set statusE(HomeStatusE value) {
    _$statusEAtom.reportWrite(value, super.statusE, () {
      super.statusE = value;
    });
  }

  late final _$filterProjectStatusAtom =
      Atom(name: '_HomeStore.filterProjectStatus', context: context);

  @override
  ProjectStatusE get filterProjectStatus {
    _$filterProjectStatusAtom.reportRead();
    return super.filterProjectStatus;
  }

  @override
  set filterProjectStatus(ProjectStatusE value) {
    _$filterProjectStatusAtom.reportWrite(value, super.filterProjectStatus, () {
      super.filterProjectStatus = value;
    });
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void onChangeStatus(HomeStatusE statusE) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.onChangeStatus');
    try {
      return super.onChangeStatus(statusE);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listProject: ${listProject},
statusE: ${statusE},
filterProjectStatus: ${filterProjectStatus}
    ''';
  }
}
