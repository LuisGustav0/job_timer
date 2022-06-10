import 'package:job_timer/app/modules/project/entities/project/project.dart';
import 'package:job_timer/app/modules/project/enums/project_status_enum.dart';
import 'package:job_timer/app/modules/project/models/project_task_model.dart';

class ProjectModel {
  final int? id;
  final String name;
  final int estimate;
  final ProjectStatusE statusE;
  final List<ProjectTaskModel> listTask;

  ProjectModel({
    this.id,
    required this.name,
    required this.estimate,
    required this.statusE,
    required this.listTask,
  });

  factory ProjectModel.fromEntity(final Project project) {
    project.listTask.loadSync();

    return ProjectModel(
      id: project.id,
      name: project.name,
      estimate: project.estimate,
      statusE: project.statusE,
      listTask: ProjectTaskModel.fromListEntity(project.listTask),
    );
  }

  static List<ProjectModel> fromListEntity(final List<Project> listProject) {
    return listProject.map(ProjectModel.fromEntity).toList();
  }
}
