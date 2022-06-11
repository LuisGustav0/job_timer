import 'dart:developer';

import 'package:job_timer/app/modules/project/models/project_model.dart';
import 'package:job_timer/app/modules/project/modules/detail/enums/project_detail_status_enum.dart';
import 'package:job_timer/app/modules/project/modules/detail/stores/detail/project_detail_store.dart';
import 'package:job_timer/app/modules/project/services/project/project_service.dart';
import 'package:mobx/mobx.dart';

part 'project_detail_controller.g.dart';

class ProjectDetailController = _ProjectDetailController
    with _$ProjectDetailController;

abstract class _ProjectDetailController with Store {
  final ProjectService _projectService;

  @observable
  ProjectDetailStore store = ProjectDetailStore();

  _ProjectDetailController({required ProjectService projectService})
      : _projectService = projectService;

  @action
  void setProjectModel(final ProjectModel? projectModel) {
    try {
      if (projectModel == null) {
        throw Exception('Erro ao carregar projeto!');
      }

      store.emit(
        statusE: ProjectDetailStatusE.complete,
        projectModel: projectModel,
      );
    } catch (error, stack) {
      log('Erro ao carregar projeto!', error: error, stackTrace: stack);

      store.emit(statusE: ProjectDetailStatusE.failure);
    }
  }

  @action
  Future<void> updateProject() async {
    final projectId = store.projectModel!.id!;
    final projectModel = await _projectService.findById(projectId);

    store.emit(projectModel: projectModel);
  }

  @action
  Future<void> finishProject() async {
    try {
      store.emit(statusE: ProjectDetailStatusE.loading);

      final projectId = store.projectModel!.id!;
      await _projectService.finish(projectId);

      await updateProject();
    } catch (error, stack) {
      log('Erro ao finalizar projeto!', error: error, stackTrace: stack);

      store.emit(statusE: ProjectDetailStatusE.failure);
    }
  }
}
