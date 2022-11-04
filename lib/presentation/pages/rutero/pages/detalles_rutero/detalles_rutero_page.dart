import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/config/routes/app_routes.dart';
import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/common/widgets/custom_app_bar.dart';
import 'package:uma/presentation/common/widgets/custom_card.dart';
import 'package:uma/presentation/pages/rutero/pages/detalles_rutero/detalles_rutero_controller.dart';
import 'package:uma/presentation/pages/rutero/pages/detalles_rutero/widgets/contacto_cliente.dart';
import 'package:uma/presentation/pages/rutero/pages/detalles_rutero/widgets/datos_cliente_rutero.dart';
import 'package:uma/presentation/pages/rutero/pages/detalles_rutero/widgets/expandable_panel.dart';

class DetallesRuteroPage extends StatelessWidget {
  const DetallesRuteroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetallesRuteroController>(
      builder: (detallesRuteroController) {
        return Scaffold(
          appBar: const CustomAppBar(),
          body: SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(
                  vertical: Get.height * 0.02, horizontal: Get.width * 0.025),
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(Get.width * 0.065,
                      Get.height * 0.015, 0, Get.height * 0.030),
                  child: Text(
                    "Rutero",
                    style: TextStyles.titleStyle2(color: kGraySubtitle),
                  ),
                ),
                CustomCard(
                  body: ExpandablePanel(
                    header: Text(
                      detallesRuteroController
                          .selectedRutero.nombreEstablecimiento!,
                      textAlign: TextAlign.center,
                      style: TextStyles.titleStyle(
                          isBold: true, color: kGrayTitle),
                    ),
                    body: const DatosClienteRutero(),
                  ),
                ),
                CustomCard(
                  body: ExpandablePanel(
                    isCartera: true,
                    header: Text(
                      "Gestión Cartera",
                      style: TextStyles.titleStyle(
                        isBold: true,
                        color: kGrayTitle,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    body: Align(
                      alignment: Alignment.bottomLeft,
                      child: InkWell(
                        customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onTap: () => Get.toNamed(AppRoutes.cartera),
                        child: Column(
                          children: [
                            Image(
                              image: const AssetImage(
                                  'assets/icons/cartera_red_icon.png'),
                              width: Get.width * 0.1,
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Text(
                              "Cartera",
                              textAlign: TextAlign.center,
                              style: TextStyles.bodyStyle(
                                      color: kGraySubtitle, isBold: true)
                                  .copyWith(
                                fontSize:
                                    Get.height * 0.015 / Get.textScaleFactor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                CustomCard(
                  body: ExpandablePanel(
                    header: Row(
                      children: [
                        Text(
                          "Contacto con\nel cliente",
                          style: TextStyles.titleStyle(
                            isBold: true,
                            color: kGrayTitle,
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            max: 3,
                            min: 0,
                            value: double.parse("${0}") + 1,
                            onChanged: (value) {},
                            activeColor: (0 == 0)
                                ? Colors.red
                                : ((0 == 0) ? Colors.green : Colors.yellow),
                            inactiveColor: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                    body: ContactoCliente(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
