import 'dart:developer';

import 'package:asuka/asuka.dart';
import 'package:job_timer/app/core/services/auth/auth_service.dart';
import 'package:job_timer/app/modules/login/enums/login_status_enum.dart';
import 'package:job_timer/app/modules/login/stores/login/login_store.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final AuthService _authService;

  @observable
  LoginStore store = LoginStore();

  _LoginController({
    required AuthService authService,
  }) : _authService = authService;

  Future<void> signIn() async {
    try {
      store.onChangeStatus(LoginStatusE.loading);

      await _authService.signIn();
    } catch (error, stack) {
      log('Erro ao realizar login', error: error, stackTrace: stack);

      store.onChangeStatus(
        LoginStatusE.failure,
        errorMessage: 'Erro ao realizar login',
      );

      AsukaSnackbar.alert('Erro ao realizar login').show();
    }
  }
}
