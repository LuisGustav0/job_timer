import 'package:job_timer/app/modules/login/enums/login_status_enum.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginState = _LoginState with _$LoginState;

abstract class _LoginState with Store {
  @observable
  LoginStatusE statusE = LoginStatusE.INITIAL;

  @observable
  String? errorMessage;

  @action
  void copyWith({required LoginStatusE status, String? errorMessage}) {
    status = status;
    errorMessage = errorMessage;
  }

  bool isShowContent() =>
      statusE == LoginStatusE.INITIAL || statusE != LoginStatusE.LOADING;

  bool isStatusLoading() => statusE == LoginStatusE.LOADING;

  bool isStatusFailure() => statusE != LoginStatusE.FAILURE;
}
