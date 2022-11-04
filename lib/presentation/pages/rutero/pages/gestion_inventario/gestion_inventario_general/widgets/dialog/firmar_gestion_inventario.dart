import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/pages/rutero/pages/gestion_inventario/gestion_inventario_general/gestion_inventario_controller.dart';
import 'widgets/dialog_title.dart';
import 'widgets/email_input.dart';
import 'widgets/save_button.dart';
import 'widgets/sign_pad_field.dart';

//RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
firmarGestionInventario(BuildContext context) async {
  return showDialog(
    barrierDismissible: true,
    context: context,
    builder: (_) {
      return GetBuilder<GestionInventarioController>(
        builder: (gestionInventarioController) {
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
