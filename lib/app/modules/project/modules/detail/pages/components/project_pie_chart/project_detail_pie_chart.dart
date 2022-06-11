import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/app_colors.dart';

class ProjectDetailPieChart extends StatelessWidget {
  const ProjectDetailPieChart({super.key});

  @override
  Widget build(BuildContext context) {
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
                  value: 50,
                  color: AppColors.primaryColor,
                  showTitle: true,
                  title: '50h',
                  titleStyle: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PieChartSectionData(
                  value: 150,
                  color: AppColors.primaryColorLight,
                  showTitle: true,
                  title: '150h',
                  titleStyle: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              '200h',
              style: TextStyle(
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
