import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/config/routes/app_routes.dart';

import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/common/widgets/custom_button.dart';
import 'package:uma/presentation/pages/rutero/pages/gestion_inventario/gestion_inventario_general/gestion_inventario_controller.dart';
import 'package:uma/presentation/pages/rutero/pages/gestion_inventario/gestion_inventario_general/widgets/dialog/firmar_gestion_inventario.dart';
import 'package:uma/presentation/pages/rutero/pages/gestion_inventario/gestion_inventario_general/widgets/excel_tab_gestion_inventario.dart';
import 'package:uma/presentation/pages/rutero/pages/gestion_inventario/resultado_inventario_mix/resultado_inventario_mix_page.dart';
import 'package:uma/presentation/pages/rutero/pages/historico_ventas/widgets/serch_filter.dart';

class GestionInventarioBody extends StatelessWidget {
  const GestionInventarioBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GestionInventarioController>(
      builder: (gestionInventarioController) {
        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: Get.height * 0.02, horizontal: Get.height * 0.025),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(Get.width * 0.065,
                    Get.height * 0.015, 0, Get.height * 0.030),
                child: Text(
                  "Gestión inventario",
                  style: TextStyles.titleStyle2(color: kGraySubtitle),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
                child: const SearchFilter(),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onTap: () {
                        Get.toNamed(AppRoutes.resultadoInventarioMix);
                      },
                      child: SizedBox(
                        height: Get.height * 0.08,
                        child: Padding(
                          padding: EdgeInsets.all(Get.height * 0.005),
                          child: const Image(
                            image: AssetImage('assets/icons/resultado.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: Get.width * 0.12),
                  Expanded(
                    child: CustomButton(
                      placeHolder: "Agregar a inventario",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              ExcelTabGestionInventario(),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      placeHolder: "Actualizar",
                      onPressed: () {
                        firmarGestionInventario(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
