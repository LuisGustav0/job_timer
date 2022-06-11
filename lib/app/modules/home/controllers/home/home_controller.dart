import 'dart:developer';

import 'package:asuka/asuka.dart';
import 'package:job_timer/app/modules/home/enums/home_status_enum.dart';
import 'package:job_timer/app/modules/home/stores/home/home_store.dart';
import 'package:job_timer/app/modules/project/enums/project_status_enum.dart';
import 'package:job_timer/app/modules/project/services/project/project_service.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final ProjectService _projectService;

  @observable
  HomeStore store = HomeStore();

  _HomeController({required ProjectService projectService})
      : _projectService = projectService;

  Future<void> init() async {
    await _loadListProject();
  }

  Future<void> _loadListProject() async {
    try {
      store.emit(statusE: HomeStatusE.loading);

      final listProject =
          await _projectService.findByStatus(store.filterProjectStatus);

      store.emit(statusE: HomeStatusE.complete, listProject: listProject);
    } catch (error, stack) {
      log('Erro ao carregar lista de projeto', error: error, stackTrace: stack);

      store.emit(statusE: HomeStatusE.failure);

      AsukaSnackbar.alert('Erro ao carregar lista de projeto').show();
    }
  }

  Future<void> onChangedStatus(final ProjectStatusE statusE) async {
    try {
      store.emit(statusE: HomeStatusE.loading, listProject: []);

      final listProject = await _projectService.findByStatus(statusE);

      store.emit(
        statusE: HomeStatusE.complete,
        listProject: listProject,
        filterProjectStatus: statusE,
      );
    } catch (error, stack) {
      log('Erro ao carregar lista de projeto', error: error, stackTrace: stack);

      store.emit(statusE: HomeStatusE.failure);

      AsukaSnackbar.alert('Erro ao carregar lista de projeto').show();
    }
  }

  Future<void> deleteAll() async {
    try {
      store.emit(statusE: HomeStatusE.loading, listProject: []);

      await _projectService.deleteAll();

      await _loadListProject();
    } catch (error, stack) {
      log('Erro ao deletar lista de projeto', error: error, stackTrace: stack);

      store.emit(statusE: HomeStatusE.failure);

      AsukaSnackbar.alert('Erro ao deletar lista de projeto').show();
    }
  }
}
