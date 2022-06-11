import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/job_timer_icons.dart';
import 'package:job_timer/app/modules/project/modules/detail/pages/components/project_detail_appbar/project_detail_appbar.dart';
import 'package:job_timer/app/modules/project/modules/detail/pages/components/project_detail_task_tile/project_detail_task_tile.dart';
import 'package:job_timer/app/modules/project/modules/detail/pages/components/project_pie_chart/project_detail_pie_chart.dart';

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({super.key});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        ProjectDetailAppbar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const Padding(
                padding: EdgeInsets.only(
                  top: 50,
                  bottom: 50,
                ),
                child: ProjectDetailPieChart(),
              ),
              ProjectDetailTaskTile(),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton.icon(
                icon: const Icon(JobTimerIcons.ok_circled2),
                label: const Text('Finalizar projeto'),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
