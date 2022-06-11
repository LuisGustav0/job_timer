import 'dart:developer';

import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/project/models/project_model.dart';
import 'package:job_timer/app/modules/project/models/project_task_model.dart';
import 'package:job_timer/app/modules/project/modules/task/enums/project_task_enum.dart';
import 'package:job_timer/app/modules/project/modules/task/stores/task/project_task_store.dart';
import 'package:job_timer/app/modules/project/services/project/project_service.dart';
import 'package:mobx/mobx.dart';

part 'project_task_controller.g.dart';

class ProjectTaskController = _ProjectTaskController
    with _$ProjectTaskController;

abstract class _ProjectTaskController with Store {
  final ProjectService _projectService;

  late final ProjectModel? _projectModel;

  @observable
  ProjectTaskStore store = ProjectTaskStore();

  _ProjectTaskController({required ProjectService projectService})
      : _projectService = projectService;

  @action
  void setProjectModel(final ProjectModel? projectModel) {
    _projectModel = projectModel;
  }

  Future<void> register(final String name, final int duration) async {
    try {
      store.emit(statusE: ProjectTaskStatusE.loading);

      final projectModelId = _projectModel!.id;

      final projectTaskModel = ProjectTaskModel(
        name: name,
        duration: duration,
      );

      await _projectService.addTask(projectModelId!, projectTaskModel);

      store.emit(statusE: ProjectTaskStatusE.success);

      Modular.to.pop();
    } catch (error, stack) {
      log('Erro ao add task no projeto', error: error, stackTrace: stack);

      store.emit(statusE: ProjectTaskStatusE.failure);

      AsukaSnackbar.alert('Erro ao add task no projeto').show();
    }
  }
}
