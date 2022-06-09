import 'dart:developer';

import 'package:asuka/asuka.dart';
import 'package:job_timer/app/core/services/auth/auth_service.dart';
import 'package:job_timer/app/modules/login/enums/login_status_enum.dart';
import 'package:job_timer/app/modules/login/stores/login/login_store.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  late AuthService _authService;

  @observable
  LoginState state = LoginState();

  _LoginController({
    required AuthService authService,
  }) : _authService = authService;

  Future<void> signIn() async {
    try {
      state.copyWith(status: LoginStatusE.LOADING);

      await _authService.signIn();
    } catch (error, stack) {
      log('Erro ao realizar login', error: error, stackTrace: stack);

      state.copyWith(
        status: LoginStatusE.FAILURE,
        errorMessage: 'Erro ao realizar login',
      );

      AsukaSnackbar.alert('Erro ao realizar login').show();
    }
  }
}
