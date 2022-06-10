import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/app_colors.dart';
import 'package:job_timer/app/modules/project/models/project_model.dart';

class ProjectProgress extends StatelessWidget {
  final ProjectModel projectModel;

  const ProjectProgress({super.key, required this.projectModel});

  @override
  Widget build(BuildContext context) {
    final totalListTask = projectModel.listTask.fold<int>(
      0,
      (previousValue, task) => previousValue += task.duration,
    );

    double percent = 0.0;

    if(totalListTask > 0) {
      percent = totalListTask / projectModel.estimate;
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.grey300,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Expanded(
            child: LinearProgressIndicator(
              value: 0.5,
              backgroundColor: AppColors.grey400,
              color: AppColors.primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text('${projectModel.estimate}h'),
          ),
        ],
      ),
    );
  }
}
