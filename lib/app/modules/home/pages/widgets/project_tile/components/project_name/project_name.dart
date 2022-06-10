import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/app_colors.dart';
import 'package:job_timer/app/core/ui/job_timer_icons.dart';
import 'package:job_timer/app/modules/project/models/project_model.dart';

class ProjectName extends StatelessWidget {
  final ProjectModel projectModel;

  const ProjectName({super.key, required this.projectModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(projectModel.name),
        const Icon(
          JobTimerIcons.angle_double_right,
          color: AppColors.primaryColor,
          size: 20,
        )
      ],
    );
  }
}
