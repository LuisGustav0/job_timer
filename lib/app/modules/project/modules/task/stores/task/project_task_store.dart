import 'package:job_timer/app/modules/project/modules/task/enums/project_task_enum.dart';
import 'package:mobx/mobx.dart';

part 'project_task_store.g.dart';

class ProjectTaskStore = _ProjectTaskStore with _$ProjectTaskStore;

abstract class _ProjectTaskStore with Store {

  @observable
  ProjectTaskStatusE statusE = ProjectTaskStatusE.initial;

  @action
  void emit({
    ProjectTaskStatusE? statusE,
  }) {
    this.statusE = statusE ?? this.statusE;
  }
}
