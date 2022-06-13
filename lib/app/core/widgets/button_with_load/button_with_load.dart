import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/app_colors.dart';

class ButtonWithLoad extends StatelessWidget {
  final String label;
  final bool isShowLoading;
  final VoidCallback onPressed;

  const ButtonWithLoad({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isShowLoading,
  });

  get showWidget {
    if(!isShowLoading) {
      return Text(label);
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        Text(label),
        const Align(
          alignment: Alignment.centerRight,
          child: CircularProgressIndicator.adaptive(
            backgroundColor: AppColors.white,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isShowLoading ? null : onPressed,
      child: showWidget,
    );
  }
}
