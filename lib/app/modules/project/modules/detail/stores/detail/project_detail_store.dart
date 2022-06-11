import 'package:job_timer/app/modules/project/enums/project_status_enum.dart';
import 'package:job_timer/app/modules/project/models/project_model.dart';
import 'package:job_timer/app/modules/project/modules/detail/enums/project_detail_status_enum.dart';
import 'package:mobx/mobx.dart';

part 'project_detail_store.g.dart';

class ProjectDetailStore = _ProjectDetailStore with _$ProjectDetailStore;

abstract class _ProjectDetailStore with Store {
  @observable
  ProjectDetailStatusE statusE = ProjectDetailStatusE.initial;

  @observable
  ProjectModel? projectModel;

  @action
  void emit({
    ProjectDetailStatusE? statusE,
    ProjectModel? projectModel,
  }) {
    this.statusE = statusE ?? this.statusE;
    this.projectModel = projectModel ?? this.projectModel;
  }

  bool isProjectFinish() {
    return projectModel != null &&
        projectModel!.statusE != ProjectStatusE.finalizado;
  }

  bool isStatusInitial() {
    return statusE == ProjectDetailStatusE.initial;
  }

  bool isStatusLoading() {
    return statusE == ProjectDetailStatusE.loading;
  }

  bool isStatusComplete() {
    return statusE == ProjectDetailStatusE.complete;
  }
}
