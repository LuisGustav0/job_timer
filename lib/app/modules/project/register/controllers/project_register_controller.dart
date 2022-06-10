import 'dart:developer';

import 'package:asuka/asuka.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/project/enums/project_status_enum.dart';
import 'package:job_timer/app/modules/project/models/project_model.dart';
import 'package:job_timer/app/modules/project/register/enums/project_register_status_enum.dart';
import 'package:job_timer/app/modules/project/register/stores/project_register/project_register_store.dart';
import 'package:job_timer/app/modules/project/services/project/project_service.dart';
import 'package:mobx/mobx.dart';

part 'project_register_controller.g.dart';

class ProjectRegisterController = _ProjectRegisterController
    with _$ProjectRegisterController;

abstract class _ProjectRegisterController with Store {
  final ProjectService _projectService;

  @observable
  ProjectRegisterStore store = ProjectRegisterStore();

  _ProjectRegisterController({
    required ProjectService projectService,
  }) : _projectService = projectService;

  Future<void> register(final String name, final int estimate) async {
    try {
      store.emit(ProjectRegisterStatusE.loading);

      final projectModel = ProjectModel(
        name: name,
        estimate: estimate,
        statusE: ProjectStatusE.em_andamento,
        listTask: [],
      );

      await _projectService.register(projectModel);

      await Future.delayed(const Duration(seconds: 5));

      Modular.to.pop();
    } catch (error, stack) {
      log('Erro ao salvar projeto', error: error, stackTrace: stack);

      store.emit(
        ProjectRegisterStatusE.failure,
        errorMessage: 'Erro ao salvar projeto',
      );

      AsukaSnackbar.alert('Erro ao salvar projeto').show();
    }
  }
}
