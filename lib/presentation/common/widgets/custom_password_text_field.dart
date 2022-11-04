import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/common/style/style.dart';

class CustomPasswordTextField extends StatelessWidget {
  final TextEditingController passwordController;
  final bool numeric;

  CustomPasswordTextField({
    super.key,
    required this.passwordController,
    this.numeric = false,
  });

  final RxBool isPasswordVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        controller: passwordController,
        obscureText: !isPasswordVisible.value,
        style: TextStyles.bodyStyle(),
        keyboardType: numeric ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock_outline),
          suffixIcon: IconButton(
            onPressed: () => isPasswordVisible.value = !isPasswordVisible.value,
            icon: isPasswordVisible.value
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: "Contraseña",
          hintStyle: TextStyles.bodyStyle(color: kGrayHints),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        ),
      ),
    );
  }
}
