import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/ui/app_colors.dart';
import 'package:job_timer/app/modules/home/controllers/home/home_controller.dart';
import 'package:job_timer/app/modules/home/pages/widgets/project_tile/components/project_name/project_name.dart';
import 'package:job_timer/app/modules/home/pages/widgets/project_tile/components/project_progress/prject_progress.dart';
import 'package:job_timer/app/modules/project/models/project_model.dart';

class ProjectTile extends StatelessWidget {
  final ProjectModel projectModel;

  const ProjectTile({super.key, required this.projectModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Modular.to.pushNamed('/project/detail/', arguments: projectModel);
        await Modular.get<HomeController>().updateList();
      },
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 90,
        ),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.grey300,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            ProjectName(
              projectModel: projectModel,
            ),
            Expanded(
              child: ProjectProgress(
                projectModel: projectModel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
