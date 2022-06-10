import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/ui/app_colors.dart';
import 'package:job_timer/app/modules/project/enums/project_status_enum.dart';

class HeaderProjectsMenu extends SliverPersistentHeaderDelegate {
  get _listProjectStatus => ProjectStatusE.values.map(
        (status) => DropdownMenuItem(
          value: status,
          child: Text(status.label),
        ),
      ).toList();

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
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    isCollapsed: true,
                  ),
                  items: _listProjectStatus,
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * .4,
                child: ElevatedButton.icon(
                  label: const Text('Novo projeto'),
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Modular.to.pushNamed('/project/register');
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
