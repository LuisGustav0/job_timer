import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/home/pages/home_page.dart';

class HomeModule extends Module {

  @override
  List<Bind> get binds => const [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomePage()),
  ];
}