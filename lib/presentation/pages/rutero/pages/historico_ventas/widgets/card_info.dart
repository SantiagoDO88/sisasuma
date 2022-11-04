import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/pages/rutero/pages/historico_ventas/historico_ventas_controller.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoricoVentasController>(
      builder: (homeController) {
        return Row(
          children: [
            Expanded(
              child: Card(
                //clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Get.height * 0.02, horizontal: Get.width * 0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Motorrepuestos",
                        style: TextStyles.subtitleStyle(
                            color: kGraySubtitle, isBold: true),
                      ),
                      Text(
                        "Los 2 Santanderes",
                        style: TextStyles.subtitleStyle(
                            color: kGraySubtitle, isBold: true),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
