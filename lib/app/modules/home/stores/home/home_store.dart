import 'package:job_timer/app/modules/home/enums/home_status_enum.dart';
import 'package:job_timer/app/modules/project/enums/project_status_enum.dart';
import 'package:job_timer/app/modules/project/models/project_model.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  List<ProjectModel> listProject = <ProjectModel>[].asObservable();

  @observable
  HomeStatusE statusE = HomeStatusE.initial;

  @observable
  ProjectStatusE filterProjectStatus = ProjectStatusE.em_andamento;

  @action
  void emit({
    HomeStatusE? statusE,
    List<ProjectModel>? listProject,
    ProjectStatusE? filterProjectStatus,
  }) {
    this.statusE = statusE ?? this.statusE;
    this.listProject = listProject ?? <ProjectModel>[].asObservable();
    this.filterProjectStatus = filterProjectStatus ?? this.filterProjectStatus;
  }

  // @action
  // void onChangeHomeStatus(final HomeStatusE statusE) {
  //   this.statusE = statusE;
  // }
  //
  // @action
  // void onChangeProjectStatus(final ProjectStatusE filterProjectStatus) {
  //   this.filterProjectStatus = filterProjectStatus;
  // }
  //
  // @action
  // void setListProject(List<ProjectModel> listProject) {
  //   this.listProject = listProject.asObservable();
  // }

  bool isStatusLoading() => statusE == HomeStatusE.loading;
}
