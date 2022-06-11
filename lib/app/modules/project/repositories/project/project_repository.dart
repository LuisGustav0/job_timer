import 'package:job_timer/app/modules/project/entities/project/project.dart';
import 'package:job_timer/app/modules/project/enums/project_status_enum.dart';

abstract class ProjectRepository {

  Future<void> register(final Project project);

  Future<List<Project>> findByStatus(final ProjectStatusE statusE);

  Future<Project> findById(final int projectId);

  Future<void> finish(final int projectId);

  Future<void> deleteAll();
}