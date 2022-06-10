import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:job_timer/app/core/database/database_service.dart';
import 'package:job_timer/app/core/exceptions/failure.dart';
import 'package:job_timer/app/modules/project/entities/project/project.dart';
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
}
