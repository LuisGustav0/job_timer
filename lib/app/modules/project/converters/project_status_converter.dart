import 'package:isar/isar.dart';
import 'package:job_timer/app/modules/project/enums/project_status_enum.dart';

class ProjectStatusConverter extends TypeConverter<ProjectStatusE, int> {

  const ProjectStatusConverter();

  @override
  ProjectStatusE fromIsar(int object) {
    return ProjectStatusE.values[object];
  }

  @override
  int toIsar(ProjectStatusE object) {
    return object.index;
  }
}