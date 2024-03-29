import 'package:isar/isar.dart';
import 'package:job_timer/app/core/database/database_service.dart';
import 'package:job_timer/app/modules/project/entities/project/project.dart';
import 'package:job_timer/app/modules/project/entities/project_task/project_task.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseServiceImpl implements DatabaseService {

  Isar? _databaseInstance;

  @override
  Future<Isar> openConnection() async {
    if (_databaseInstance == null) {
      final dir = await getApplicationSupportDirectory();
      _databaseInstance = await Isar.open(
        schemas: [
          ProjectTaskSchema,
          ProjectSchema,
        ],
        directory: dir.path,
        inspector: true,
      );
    }

    return _databaseInstance!;
  }
}
