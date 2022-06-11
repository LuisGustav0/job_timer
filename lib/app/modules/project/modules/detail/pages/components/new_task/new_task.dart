import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/app_colors.dart';

class NewTask extends StatelessWidget {
  const NewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
