import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/home/controllers/home/home_controller.dart';
import 'package:job_timer/app/modules/home/pages/home_page.dart';
import 'package:job_timer/app/modules/project/project_module.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        ...ProjectModule.exports,
        Bind.lazySingleton<HomeController>(
          (i) => HomeController(
            projectService: i(),
          ),
        ),
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
