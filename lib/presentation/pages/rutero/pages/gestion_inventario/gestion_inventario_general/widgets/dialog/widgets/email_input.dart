import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/common/widgets/widgets.dart';
import 'package:uma/presentation/pages/rutero/pages/gestion_inventario/gestion_inventario_general/gestion_inventario_controller.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/seguimiento_planes_general/seguimiento_planes_controller.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GestionInventarioController>(
      builder: (gestionInventarioController) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.05,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextFieldDialog(
                    textEditingController:
                        gestionInventarioController.emailController,
                    hint: "Correo",
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
