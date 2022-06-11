import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/app_colors.dart';

class ProjectDetailTaskTile extends StatelessWidget {
  const ProjectDetailTaskTile({super.key});

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
          const Text('Nome da task'),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Duração',
                  style: TextStyle(
                    color: AppColors.grey,
                  ),
                ),
                TextSpan(
                  text: '    ',
                  style: TextStyle(
                    color: AppColors.grey,
                  ),
                ),
                TextSpan(
                  text: '4h',
                  style: TextStyle(
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
