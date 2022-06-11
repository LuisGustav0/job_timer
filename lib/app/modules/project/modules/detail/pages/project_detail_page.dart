import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:job_timer/app/core/ui/job_timer_icons.dart';
import 'package:job_timer/app/modules/project/models/project_model.dart';
import 'package:job_timer/app/modules/project/modules/detail/controllers/project_detail/project_detail_controller.dart';
import 'package:job_timer/app/modules/project/modules/detail/enums/project_detail_status_enum.dart';
import 'package:job_timer/app/modules/project/modules/detail/pages/components/project_detail_appbar/project_detail_appbar.dart';
import 'package:job_timer/app/modules/project/modules/detail/pages/components/project_detail_task_tile/project_detail_task_tile.dart';
import 'package:job_timer/app/modules/project/modules/detail/pages/components/project_pie_chart/project_detail_pie_chart.dart';

class ProjectDetailPage extends StatefulWidget {
  final ProjectDetailController controller;

  const ProjectDetailPage({super.key, required this.controller});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  _buildScaffoldBody(BuildContext context) {
    final projectModel = widget.controller.store.projectModel;

    switch (widget.controller.store.statusE) {
      case ProjectDetailStatusE.initial:
        return const Center(
          child: Text('Carregando projeto...'),
        );
      case ProjectDetailStatusE.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case ProjectDetailStatusE.complete:
        return _buildProjectDetail(context, projectModel!);
      case ProjectDetailStatusE.failure:
        return const Center(
          child: Text('Erro ao carregar projeto!'),
        );
    }
  }

  Widget _buildProjectDetail(BuildContext context, ProjectModel projectModel) {
    return CustomScrollView(
      slivers: [
        ProjectDetailAppbar(
          projectModel: projectModel,
        ),
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
                onPressed: () async {
                  await widget.controller.finishProject();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        body: _buildScaffoldBody(context),
      ),
    );
  }
}
