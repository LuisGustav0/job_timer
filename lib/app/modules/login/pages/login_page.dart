import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/app_colors.dart';
import 'package:job_timer/app/modules/login/controllers/login/login_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  final LoginController controller;

  const LoginPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final heightSpace = screenSize.height * .1;

    final widthButtonGoogle = screenSize.width * .8;
    const heightButtonGoogle = 49.0;

    return Observer(
      builder: (_) => Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff0092b9),
                Color(0xff0167b2),
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),
                SizedBox(
                  height: heightSpace,
                ),
                SizedBox(
                  width: widthButtonGoogle,
                  height: heightButtonGoogle,
                  child: ElevatedButton(
                    onPressed: () async => await widget.controller.signIn(),
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.grey200,
                    ),
                    child: Image.asset('assets/images/google.png'),
                  ),
                ),
                Visibility(
                  visible: widget.controller.store.isStatusLoading(),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Center(
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: AppColors.white,
                      ),
                    ),
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
