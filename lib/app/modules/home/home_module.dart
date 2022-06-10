import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/home/controllers/home/home_controller.dart';
import 'package:job_timer/app/modules/home/pages/home_page.dart';
import 'package:job_timer/app/modules/project/repositories/project/project_repository.dart';
import 'package:job_timer/app/modules/project/repositories/project/project_repository_impl.dart';
import 'package:job_timer/app/modules/project/services/project/project_service.dart';
import 'package:job_timer/app/modules/project/services/project/project_service_impl.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton<ProjectRepository>(
            (i) => ProjectRepositoryImpl(databaseService: i())),
    Bind.lazySingleton<ProjectService>(
            (i) => ProjectServiceImpl(projectRepository: i())),
    Bind.lazySingleton<HomeController>((i) => HomeController(projectService: i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      '/',
      child: (context, args) => HomePage(
        controller: Modular.get<HomeController>()..init(),
      ),
    ),
  ];
}
