import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/ui/app_colors.dart';
import 'package:job_timer/app/modules/home/controllers/home/home_controller.dart';
import 'package:job_timer/app/modules/project/enums/project_status_enum.dart';

class HeaderProjectMenu extends SliverPersistentHeaderDelegate {
  final HomeController _controller;

  HeaderProjectMenu({
    required HomeController controller,
  }) : _controller = controller;

  get _listProjectStatus => ProjectStatusE.values
      .map(
        (status) => DropdownMenuItem(
          value: status,
          child: Text(status.label),
        ),
      )
      .toList();

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.all(10),
          color: AppColors.white,
          height: constraints.maxHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: constraints.maxWidth * .5,
                child: DropdownButtonFormField<ProjectStatusE>(
                  value: ProjectStatusE.em_andamento,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    isCollapsed: true,
                  ),
                  items: _listProjectStatus,
                  onChanged: (value) async {
                    if (value == null) return;

                    _controller.onChangedStatus(value);
                  },
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * .4,
                child: ElevatedButton.icon(
                  label: const Text('Novo projeto'),
                  icon: const Icon(Icons.add),
                  onPressed: () async {
                    await Modular.to.pushNamed('/project/register/');

                    _controller.init();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  double get maxExtent => 80.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
