import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/common/widgets/widgets.dart';
import 'package:uma/presentation/pages/rutero/pages/gestion_inventario/gestion_inventario_general/gestion_inventario_controller.dart';
import 'package:uma/presentation/pages/rutero/pages/gestion_inventario/resultado_inventario_mix/widgets/excel_tab_resultado_inventario_mix.dart';

class ResultadoInventarioMixPage extends StatelessWidget {
  const ResultadoInventarioMixPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GestionInventarioController>(
      builder: (gestionInventarioController) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: const CustomAppBar(),
            body: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Get.height * 0.02,
                          horizontal: Get.height * 0.025),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(Get.width * 0.065,
                                Get.height * 0.015, 0, Get.height * 0.030),
                            child: Text(
                              "Resultado inventario mix",
                              style:
                                  TextStyles.titleStyle2(color: kGraySubtitle),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          ExcelTabResultadoInventarioMix(),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
