import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/app_colors.dart';

class ProjectDetailPieChart extends StatelessWidget {
  final int projectEstimate;
  final int totalTask;

  const ProjectDetailPieChart({
    super.key,
    required this.projectEstimate,
    required this.totalTask,
  });

  @override
  Widget build(BuildContext context) {
    final residual = (projectEstimate - totalTask);

    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        fit: StackFit.loose,
        children: [
          PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: totalTask.toDouble(),
                  color: AppColors.primaryColor,
                  showTitle: true,
                  title: '${totalTask}h',
                  titleStyle: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PieChartSectionData(
                  value: residual.toDouble(),
                  color: AppColors.primaryColorLight,
                  showTitle: true,
                  title: '${residual}h',
                  titleStyle: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '${projectEstimate}h',
              style: const TextStyle(
                fontSize: 25,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
