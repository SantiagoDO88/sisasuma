import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/pages/login/login_controller.dart';

import 'package:uma/presentation/common/widgets/widgets.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (loginController) => Padding(
        padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.1, horizontal: Get.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: Get.height * 0.1),
            Image(
              image: const AssetImage('assets/icons/logo.png'),
              width: Get.width,
            ),
            SizedBox(height: Get.height * 0.1),
            CustomTextField(
              textEditingController: loginController.userController,
              hint: "Usuario",
              prefixIcon: const Icon(
                Icons.person_outline,
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            CustomPasswordTextField(
              passwordController: loginController.passwordController,
            ),
            SizedBox(height: Get.height * 0.1),
            CustomButton(
              placeHolder: 'Iniciar Sesión',
              onPressed: () => loginController.logUser(),
            ),
          ],
        ),
      ),
    );
  }
}
