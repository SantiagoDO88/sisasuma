import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/config/routes/app_routes.dart';
import 'package:uma/presentation/common/widgets/widgets.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_agregar/widgets/card_info.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_finalizar/medicion_precios_finalizar_controller.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_finalizar/widgets/card_events.dart';

class MedicionPreciosFinalizarBody extends StatelessWidget {
  const MedicionPreciosFinalizarBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MedicionPreciosFinalizarController>(
        builder: (medicionPreciosController) {
      return Padding(
        padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.02, horizontal: Get.height * 0.025),
        child: Column(
          children: [
            const CardInfo(),
            SizedBox(
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.020),
                child: CustomButton(
                    placeHolder: 'Finalizar Medicion', onPressed: () =>medicionPreciosController.enviarDB() ),
              ),
            ),
            Expanded(child: CardEvents()),
            SizedBox(
              width: Get.width,
              child: CustomButton(
                placeHolder: 'Agregar Medicion',
                onPressed: () =>
                    Get.offAndToNamed(AppRoutes.medicionPreciosAgregar),
              ),
            ),
          ],
        ),
      );
    });
  }
}
