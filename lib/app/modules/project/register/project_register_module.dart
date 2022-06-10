import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/project/register/controllers/project_register_controller.dart';
import 'package:job_timer/app/modules/project/register/pages/project_register_page.dart';

class ProjectRegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
            (i) => ProjectRegisterController(projectService: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => ProjectRegisterPage(
            controller: Modular.get(),
          ),
        ),
      ];
}
