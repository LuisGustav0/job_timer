import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/ui/app_colors.dart';
import 'package:job_timer/app/modules/project/models/project_model.dart';
import 'package:job_timer/app/modules/project/modules/detail/controllers/project_detail/project_detail_controller.dart';

class NewTask extends StatelessWidget {
  final ProjectModel projectModel;

  const NewTask({required this.projectModel, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Modular.to.pushNamed('/project/task/', arguments: projectModel);
        await Modular.get<ProjectDetailController>().updateProject();
      },
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child: Icon(
                Icons.add,
                color: AppColors.white,
                size: 20,
              ),
            ),
          ),
          Text('Adicionar task'),
        ],
      ),
    );
  }
}
