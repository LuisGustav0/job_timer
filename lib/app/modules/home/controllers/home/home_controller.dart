import 'dart:developer';

import 'package:asuka/asuka.dart';
import 'package:job_timer/app/modules/home/enums/home_status_enum.dart';
import 'package:job_timer/app/modules/home/stores/home/home_store.dart';
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
      store.onChangeStatus(HomeStatusE.loading);
    } catch (error, stack) {
      log('Erro ao carregar lista de projeto', error: error, stackTrace: stack);

      AsukaSnackbar.alert('Erro ao carregar lista de projeto').show();
    }
  }
}
