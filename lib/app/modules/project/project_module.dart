import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/project/modules/detail/project_detail_module.dart';
import 'package:job_timer/app/modules/project/modules/register/project_register_module.dart';
import 'package:job_timer/app/modules/project/modules/task/project_task_module.dart';
import 'package:job_timer/app/modules/project/repositories/project/project_repository.dart';
import 'package:job_timer/app/modules/project/repositories/project/project_repository_impl.dart';
import 'package:job_timer/app/modules/project/services/project/project_service.dart';
import 'package:job_timer/app/modules/project/services/project/project_service_impl.dart';

class ProjectModule extends Module {
  static List<Bind> get exports => [
        Bind.lazySingleton<ProjectRepository>(
            (i) => ProjectRepositoryImpl(databaseService: i())),
        Bind.lazySingleton<ProjectService>(
            (i) => ProjectServiceImpl(projectRepository: i())),
      ];

  @override
  List<Bind> get binds => [
    Bind.lazySingleton<ProjectRepository>(
        (i) => ProjectRepositoryImpl(databaseService: i())),
    Bind.lazySingleton<ProjectService>(
        (i) => ProjectServiceImpl(projectRepository: i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/register', module: ProjectRegisterModule()),
    ModuleRoute('/detail', module: ProjectDetailModule()),
    ModuleRoute('/task', module: ProjectTaskModule()),
  ];
}
