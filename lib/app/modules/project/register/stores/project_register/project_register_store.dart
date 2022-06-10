import 'package:job_timer/app/modules/project/register/enums/project_register_status_enum.dart';
import 'package:mobx/mobx.dart';

part 'project_register_store.g.dart';

class ProjectRegisterStore = _ProjectRegisterStore with _$ProjectRegisterStore;

abstract class _ProjectRegisterStore with Store {
  @observable
  ProjectRegisterStatusE statusE = ProjectRegisterStatusE.initial;

  @action
  void onChangeStatus(
    ProjectRegisterStatusE status, {
    String? errorMessage,
  }) {
    status = status;
    errorMessage = errorMessage;
  }

  bool isShowContent() =>
      statusE == ProjectRegisterStatusE.initial ||
      statusE != ProjectRegisterStatusE.loading;

  bool isStatusLoading() => statusE == ProjectRegisterStatusE.loading;

  bool isStatusFailure() => statusE != ProjectRegisterStatusE.failure;
}
