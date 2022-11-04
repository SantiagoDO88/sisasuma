import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/common/widgets/widgets.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/seguimiento_planes_general/seguimiento_planes_controller.dart';

class SignPadField extends StatelessWidget {
  const SignPadField({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SeguimientoPlanesController>(
      builder: (seguimientoPlanesController) {
        final sisas = TextEditingController();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextFieldDialog(
                    textEditingController: sisas,
                    hint: "Firma",
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
