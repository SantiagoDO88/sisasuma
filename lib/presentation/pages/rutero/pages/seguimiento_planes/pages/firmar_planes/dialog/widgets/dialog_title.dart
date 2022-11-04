import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/pages/home/home_controller.dart';

import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/helpers/pretty_strings.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/seguimiento_planes_general/seguimiento_planes_controller.dart';

class DialogTitle extends StatelessWidget {
  const DialogTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SeguimientoPlanesController>(
      builder: (seguimientoPlanesController) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Nuevo plan",
            style: TextStyles.titleStyle2(),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Text(
              "Para registrar los planes de seguimiento, el responsable del punto de venta debe ingresar su firma",
              style: TextStyles.titleStyle(isBold: false),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
