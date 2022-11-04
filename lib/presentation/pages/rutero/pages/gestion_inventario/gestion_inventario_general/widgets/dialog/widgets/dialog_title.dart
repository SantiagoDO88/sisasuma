import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/pages/rutero/pages/gestion_inventario/gestion_inventario_general/gestion_inventario_controller.dart';

class DialogTitle extends StatelessWidget {
  const DialogTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GestionInventarioController>(
      builder: (gestionInventarioController) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Actualizar",
            style: TextStyles.titleStyle2(),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
        ],
      ),
    );
  }
}
