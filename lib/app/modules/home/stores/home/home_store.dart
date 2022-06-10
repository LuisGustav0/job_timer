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
  void onChangeStatus(final HomeStatusE statusE) {
    this.statusE = statusE;
  }

  @action
  void setListProject(List<ProjectModel> listProject) {
    this.listProject = listProject.asObservable();
  }

  bool isStatusLoading() => statusE == HomeStatusE.loading;
}
