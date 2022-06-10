import 'package:job_timer/app/modules/project/entities/project/project.dart';
import 'package:job_timer/app/modules/project/enums/project_status_enum.dart';
import 'package:job_timer/app/modules/project/models/project_model.dart';
import 'package:job_timer/app/modules/project/repositories/project/project_repository.dart';
import 'package:job_timer/app/modules/project/services/project/project_service.dart';

class ProjectServiceImpl implements ProjectService {
  final ProjectRepository _projectRepository;

  ProjectServiceImpl({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;

  @override
  Future<void> register(final ProjectModel projectModel) async {
    final project =  Project()
      ..id = projectModel.id
      ..name = projectModel.name
      ..statusE = projectModel.statusE
      ..estimate = projectModel.estimate;

    await _projectRepository.register(project);
  }

  @override
  Future<List<ProjectModel>> findByStatus(ProjectStatusE statusE) async {
    final listProject = await _projectRepository.findByStatus(statusE);

    return ProjectModel.fromListEntity(listProject);
  }
}
