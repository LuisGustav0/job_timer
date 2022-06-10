import 'package:isar/isar.dart';
import 'package:job_timer/app/modules/project/entities/project_task/project_task.dart';

class ProjectTaskModel {
  final int? id;
  final String name;
  final int duration;

  ProjectTaskModel({
    this.id,
    required this.name,
    required this.duration,
  });

  factory ProjectTaskModel.fromEntity(final ProjectTask projectTask) {
    return ProjectTaskModel(
      id: projectTask.id,
      name: projectTask.name,
      duration: projectTask.duration,
    );
  }

  static List<ProjectTaskModel> fromListEntity(
      final IsarLinks<ProjectTask> listProjectTask) {
    return listProjectTask.map(ProjectTaskModel.fromEntity).toList();
  }
}
