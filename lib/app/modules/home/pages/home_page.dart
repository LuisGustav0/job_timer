import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:job_timer/app/modules/home/controllers/home/home_controller.dart';
import 'package:job_timer/app/modules/home/pages/widgets/header_list_project_menu/header_project_menu.dart';
import 'package:job_timer/app/modules/home/pages/widgets/project_tile/project_tile.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        drawer: Drawer(
          child: SafeArea(
            child: ListTile(
              title: InkWell(
                child: const Text('Sair'),
                onTap: () async {
                    await widget.controller.deleteAll();
                },
              ),
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
                delegate: HeaderProjectMenu(
                  controller: widget.controller,
                ),
                pinned: true,
              ),
              SliverVisibility(
                visible: widget.controller.store.isStatusLoading(),
                sliver: const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 50,
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  widget.controller.store.listProject
                      .map(
                        (project) => ProjectTile(
                          projectModel: project,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
