import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/project/modules/task/pages/task/project_task_page.dart';

class ProjectTaskModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ProjectTaskPage()),
      ];
}
