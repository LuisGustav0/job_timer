import 'package:job_timer/app/modules/project/enums/project_status_enum.dart';
import 'package:job_timer/app/modules/project/models/project_model.dart';

abstract class ProjectService {

  Future<void> register(final ProjectModel projectModel);

  Future<List<ProjectModel>> findByStatus(final ProjectStatusE statusE);

  Future<ProjectModel> findById(final int projectId);

  Future<void> finish(final int projectId);

  Future<void> deleteAll();
}