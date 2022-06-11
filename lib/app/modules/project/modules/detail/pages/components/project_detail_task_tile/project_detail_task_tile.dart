import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/app_colors.dart';
import 'package:job_timer/app/modules/project/models/project_task_model.dart';

class ProjectDetailTaskTile extends StatelessWidget {
  final ProjectTaskModel projectTaskModel;

  const ProjectDetailTaskTile({super.key, required this.projectTaskModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.grey200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(projectTaskModel.name),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Duração',
                  style: TextStyle(
                    color: AppColors.grey,
                  ),
                ),
                const TextSpan(
                  text: '    ',
                  style: TextStyle(
                    color: AppColors.grey,
                  ),
                ),
                TextSpan(
                  text: '${projectTaskModel.duration}h',
                  style: const TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
