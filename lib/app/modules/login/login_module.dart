import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/login/pages/login_page.dart';

class LoginModule extends Module {

  @override
  List<Bind> get binds => const [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const LoginPage()),
  ];
}