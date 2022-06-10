import 'package:job_timer/app/modules/login/enums/login_status_enum.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  LoginStatusE statusE = LoginStatusE.initial;

  @observable
  String? errorMessage;

  @action
  void onChangeStatus(LoginStatusE status, {String? errorMessage}) {
    status = status;
    errorMessage = errorMessage;
  }

  bool isStatusLoading() => statusE == LoginStatusE.loading;

  // bool isStatusFailure() => statusE != LoginStatusE.failure;
}
