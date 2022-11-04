import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/common/widgets/widgets.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/seguimiento_planes_general/seguimiento_planes_controller.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SeguimientoPlanesController>(
      builder: (seguimientoPlanesController) {
        return CustomButton(
          placeHolder: 'Guardar',
          onPressed: () => {},
        );
      },
    );
  }
}
