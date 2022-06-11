import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/app_colors.dart';
import 'package:job_timer/app/modules/project/modules/detail/pages/components/new_task/new_task.dart';

class ProjectDetailAppbar extends SliverAppBar {
  ProjectDetailAppbar({super.key})
      : super(
          pinned: true,
          centerTitle: true,
          toolbarHeight: 100,
          expandedHeight: 100,
          title: const Text('Projeto X'),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          flexibleSpace: Stack(
            children: [
              Align(
                alignment: const Alignment(0, 1.6),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('10 tasks'),
                          NewTask(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
}
