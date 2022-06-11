import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/project/models/project_model.dart';
import 'package:job_timer/app/modules/project/modules/detail/controllers/project_detail/project_detail_controller.dart';
import 'package:job_timer/app/modules/project/modules/detail/pages/project_detail_page.dart';

class ProjectDetailModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => ProjectDetailController(projectService: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) {
            final ProjectModel? projectModel = args.data;
            
            return ProjectDetailPage(
              controller: Modular.get()..setProjectModel(projectModel),
            );
          },
        ),
      ];
}
