import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:job_timer/app/core/ui/app_colors.dart';
import 'package:job_timer/app/core/widgets/button_with_load/button_with_load.dart';
import 'package:job_timer/app/modules/project/modules/register/controllers/project_register_controller.dart';
import 'package:validatorless/validatorless.dart';

class ProjectRegisterPage extends StatefulWidget {
  final ProjectRegisterController controller;

  const ProjectRegisterPage({
    super.key,
    required this.controller,
  });

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

class _ProjectRegisterPageState extends State<ProjectRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameTxtEdtCtrl = TextEditingController();
  final _estimateTxtEdtCtrl = TextEditingController();

  @override
  void dispose() {
    _nameTxtEdtCtrl.dispose();
    _estimateTxtEdtCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    final double widthBtnSave = sizeScreen.width;
    const double heightBtnSave = 49;

    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: const Text(
            'Criar novo projeto',
            style: TextStyle(
              color: AppColors.black,
            ),
          ),
          backgroundColor: AppColors.white,
          iconTheme: const IconThemeData(
            color: AppColors.black,
          ),
          elevation: 0,
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
                    label: Text('Nome do projeto'),
                  ),
                  validator: Validatorless.required('Nome obrigatório'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _estimateTxtEdtCtrl,
                  decoration: const InputDecoration(
                    label: Text('Estimativa de horas'),
                  ),
                  keyboardType: TextInputType.number,
                  validator: Validatorless.multiple([
                    Validatorless.required('Estimativa obrigatório'),
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
                    isShowLoading: widget.controller.store.isStatusLoading(),
                    onPressed: () async {
                      final formValid =
                          _formKey.currentState?.validate() ?? false;

                      if (formValid) {
                        final name = _nameTxtEdtCtrl.text;
                        final estimate = int.parse(_estimateTxtEdtCtrl.text);

                        await widget.controller.register(name, estimate);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
