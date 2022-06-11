import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/app_colors.dart';
import 'package:job_timer/app/core/widgets/button_with_load/button_with_load.dart';
import 'package:job_timer/app/modules/project/modules/task/controllers/task/project_task_controller.dart';
import 'package:validatorless/validatorless.dart';

class ProjectTaskPage extends StatefulWidget {
  final ProjectTaskController _controller;

  const ProjectTaskPage({super.key, required ProjectTaskController controller})
      : _controller = controller;

  @override
  State<ProjectTaskPage> createState() => _ProjectTaskPageState();
}

class _ProjectTaskPageState extends State<ProjectTaskPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameTxtEdtCtrl = TextEditingController();
  final _durationTxtEdtCtrl = TextEditingController();

  @override
  void dispose() {
    _nameTxtEdtCtrl.dispose();
    _durationTxtEdtCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    final double widthBtnSave = sizeScreen.width;
    const double heightBtnSave = 49;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Criar nova task',
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.black,
        ),
        backgroundColor: AppColors.white,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                controller: _nameTxtEdtCtrl,
                decoration: const InputDecoration(
                  label: Text('Nome da task'),
                ),
                validator: Validatorless.required('Nome é obrigatório'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _durationTxtEdtCtrl,
                decoration: const InputDecoration(
                  label: Text('Duração da task'),
                ),
                keyboardType: TextInputType.number,
                validator: Validatorless.multiple([
                  Validatorless.required('Duração é obrigatório'),
                  Validatorless.number('Permitido somente números'),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: widthBtnSave,
                height: heightBtnSave,
                child: ButtonWithLoad(
                  label: 'Salvar',
                  isShowLoading: false,
                  onPressed: () async {
                    final formValid =
                        _formKey.currentState?.validate() ?? false;

                    if (formValid) {
                      final name = _nameTxtEdtCtrl.text;
                      final duration = int.parse(_durationTxtEdtCtrl.text);

                      widget._controller.register(name, duration);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
