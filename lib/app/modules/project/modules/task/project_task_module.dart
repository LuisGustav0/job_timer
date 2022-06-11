import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/project/models/project_model.dart';
import 'package:job_timer/app/modules/project/modules/task/controllers/task/project_task_controller.dart';
import 'package:job_timer/app/modules/project/modules/task/pages/task/project_task_page.dart';

class ProjectTaskModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => ProjectTaskController(projectService: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) {
            final ProjectModel? projectModel = args.data;

            return ProjectTaskPage(
              controller: Modular.get()..setProjectModel(projectModel),
            );
          },
        ),
      ];
}
