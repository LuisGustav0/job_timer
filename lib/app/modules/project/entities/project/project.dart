import 'package:isar/isar.dart';
import 'package:job_timer/app/modules/project/converters/project_status_converter.dart';
import 'package:job_timer/app/modules/project/entities/project_task/project_task.dart';
import 'package:job_timer/app/modules/project/enums/project_status_enum.dart';

part 'project.g.dart';

@Collection()
class Project {
  @Id()
  int? id;

  late String name;

  late int estimate;

  @ProjectStatusConverter()
  late ProjectStatusE statusE;

  final listTask = IsarLinks<ProjectTask>();
}
