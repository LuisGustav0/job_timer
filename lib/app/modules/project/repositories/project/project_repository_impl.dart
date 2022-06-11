import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:job_timer/app/core/database/database_service.dart';
import 'package:job_timer/app/core/exceptions/failure.dart';
import 'package:job_timer/app/modules/project/entities/project/project.dart';
import 'package:job_timer/app/modules/project/entities/project_task/project_task.dart';
import 'package:job_timer/app/modules/project/enums/project_status_enum.dart';
import 'package:job_timer/app/modules/project/repositories/project/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final DatabaseService _databaseService;

  ProjectRepositoryImpl({required DatabaseService databaseService})
      : _databaseService = databaseService;

  @override
  Future<void> register(final Project project) async {
    try {
      final connection = await _databaseService.openConnection();

      await connection.writeTxn((isar) => isar.projects.put(project));
    } on IsarError catch (error, stack) {
      log('Erro ao cadastrar projeto', error: error, stackTrace: stack);

      throw Failure(message: 'Erro ao cadastrar projeto');
    }
  }

  @override
  Future<List<Project>> findByStatus(ProjectStatusE statusE) async {
    try {
      final connection = await _databaseService.openConnection();

      final listProject =
          connection.projects.filter().statusEEqualTo(statusE).findAll();

      return listProject;
    } on IsarError catch (error, stack) {
      log(
        'Erro ao buscar lista de projeto por status',
        error: error,
        stackTrace: stack,
      );

      throw Failure(message: 'Erro ao buscar lista de projeto por status');
    }
  }

  @override
  Future<Project> findById(int projectId) async {
    try {
      final connection = await _databaseService.openConnection();
      final project = await connection.projects.get(projectId);

      if (project == null) {
        throw Failure(message: 'Projeto não encontrado');
      }

      return project;
    } on IsarError catch (error, stack) {
      log(
        'Projeto não encontrado',
        error: error,
        stackTrace: stack,
      );

      throw Failure(message: 'Projeto não encontrado');
    }
  }

  @override
  Future<void> finish(final int projectId) async {
    try {
      final connection = await _databaseService.openConnection();
      final project = await findById(projectId);

      project.statusE = ProjectStatusE.finalizado;

      await connection.writeTxn(
        (isar) => connection.projects.put(
          project,
          saveLinks: true,
        ),
      );
    } on IsarError catch (error, stack) {
      log(
        'Erro ao finalizar projeto',
        error: error,
        stackTrace: stack,
      );

      throw Failure(message: 'Erro ao finalizar projeto');
    }
  }

  @override
  Future<void> deleteAll() async {
    try {
      final connection = await _databaseService.openConnection();

      await connection.writeTxn((isar) => isar.projects.clear());
    } on IsarError catch (error, stack) {
      log(
        'Erro ao deletar lista de projeto',
        error: error,
        stackTrace: stack,
      );

      throw Failure(message: 'Erro ao deletar lista de projeto');
    }
  }

  @override
  Future<Project> addTask(final int projectId, final ProjectTask task) async {
    try {
      final connection = await _databaseService.openConnection();

      final project = await findById(projectId);
      project.listTask.add(task);

      await connection.writeTxn((isar) => project.listTask.save());

      return project;
    } on IsarError catch (error, stack) {
      log(
        'Erro ao salvar task no projeto',
        error: error,
        stackTrace: stack,
      );

      throw Failure(message: 'Erro ao salvar task no projeto');
    }
  }
}
