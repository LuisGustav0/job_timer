import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/database/database_service.dart';
import 'package:job_timer/app/core/database/database_service_impl.dart';
import 'package:job_timer/app/core/pages/splash_page.dart';
import 'package:job_timer/app/core/services/auth/auth_service.dart';
import 'package:job_timer/app/core/services/auth/auth_service_impl.dart';
import 'package:job_timer/app/modules/home/home_module.dart';
import 'package:job_timer/app/modules/login/login_module.dart';

class AppModule extends Module {

  @override
  List<Bind> get binds => [
    Bind.lazySingleton<AuthService>((i) => AuthServiceImpl()),
    Bind.lazySingleton<DatabaseService>((i) => DatabaseServiceImpl()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const SplashPage()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
