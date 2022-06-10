import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/app_colors.dart';
import 'package:job_timer/app/modules/home/controllers/home/home_controller.dart';
import 'package:job_timer/app/modules/home/pages/widgets/header_projects_menu.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: SafeArea(
          child: ListTile(
            title: Text('Sair'),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('Projetos'),
              expandedHeight: 100,
              toolbarHeight: 100,
              centerTitle: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: HeaderProjectsMenu(),
              pinned: true,
            ),
            // Visibility(
            //   visible: widget.controller.store.isStatusLoading(),
            //   child: const SizedBox(
            //     height: 50,
            //     child: Center(
            //       child: CircularProgressIndicator.adaptive(),
            //     ),
            //   ),
            // ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: 80,
                    color: AppColors.blue,
                  ),
                  Container(
                    height: 80,
                    color: AppColors.blue,
                  ),
                  Container(
                    height: 80,
                    color: AppColors.blue,
                  ),
                  Container(
                    height: 80,
                    color: AppColors.blue,
                  ),
                  Container(
                    height: 80,
                    color: AppColors.blue,
                  ),
                  Container(
                    height: 80,
                    color: AppColors.blue,
                  ),
                  Container(
                    height: 80,
                    color: AppColors.blue,
                  ),
                  Container(
                    height: 80,
                    color: AppColors.blue,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
