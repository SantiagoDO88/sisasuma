import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/firmar_planes/dialog/widgets/dialog_title.dart';

import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/firmar_planes/dialog/widgets/email_input.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/firmar_planes/dialog/widgets/save_button.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/firmar_planes/dialog/widgets/sign_pad_field.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/seguimiento_planes_general/seguimiento_planes_controller.dart';

//RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
firmarPlanesDialog(BuildContext context) async {
  return showDialog(
    barrierDismissible: true,
    context: context,
    builder: (_) {
      return GetBuilder<SeguimientoPlanesController>(
        builder: (seguimientoPlanesController) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Dialog(
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              insetPadding: const EdgeInsets.all(10),
              elevation: 10,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.1, vertical: Get.height * 0.04),
                  width: MediaQuery.of(context).size.width * 0.85,
                  //sheight: MediaQuery.of(context).size.height * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DialogTitle(),
                      SignPadField(),
                      EmailInput(),
                      SizedBox(height: Get.height * 0.05),
                      SaveButton(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
