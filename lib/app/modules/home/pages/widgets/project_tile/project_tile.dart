import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/app_colors.dart';
import 'package:job_timer/app/modules/home/pages/widgets/project_tile/components/project_name/project_name.dart';
import 'package:job_timer/app/modules/home/pages/widgets/project_tile/components/project_progress/prject_progress.dart';
import 'package:job_timer/app/modules/project/models/project_model.dart';

class ProjectTile extends StatelessWidget {
  final ProjectModel projectModel;

  const ProjectTile({super.key, required this.projectModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 90,
      ),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.grey300,
          width: 4,
        ),
      ),
      child: Column(
        children: [
          ProjectName(
            projectModel: projectModel,
          ),
          ProjectProgress(
            projectModel: projectModel,
          ),
        ],
      ),
    );
  }
}
