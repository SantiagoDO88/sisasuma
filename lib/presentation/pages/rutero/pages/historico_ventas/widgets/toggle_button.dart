import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/style.dart';

import 'package:uma/presentation/pages/rutero/pages/historico_ventas/historico_ventas_controller.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoricoVentasController>(
      builder: (historicoVentasController) {
        return Container(
          width: Get.width,
          height: Get.height * 0.09,
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.02, vertical: Get.width * 0.02),
          decoration: const BoxDecoration(
            color: kPrimaryGrey,
            borderRadius: BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: Alignment(
                    historicoVentasController.changeButtonColor.value, 0),
                duration: const Duration(milliseconds: 300),
                child: Container(
                  width: Get.width * 0.45,
                  height: Get.height,
                  decoration: const BoxDecoration(
                    color: kPrimaryWhite,
                    borderRadius: BorderRadius.all(
                      Radius.circular(35.0),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Align(
                  alignment: const Alignment(-1, 0),
                  child: Container(
                    width: Get.width * 0.44,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text("Repuestos", style: TextStyles.bodyStyle()),
                  ),
                ),
                onTap: () {
                  historicoVentasController.cambiarRepuestos();
                  // historicoVentasController.tabController.value = "repuestos";
                  // historicoVentasController.changeButtonColor.value = -1.0;
                },
              ),
              GestureDetector(
                child: Align(
                  alignment: const Alignment(1, 0),
                  child: Container(
                    width: Get.width * 0.44,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text("Vehículos", style: TextStyles.bodyStyle()),
                  ),
                ),
                onTap: () {
                  historicoVentasController.cambiarVehiculos();
                  // historicoVentasController.tabController.value = "vehiculos";
                  // historicoVentasController.changeButtonColor.value = 1.0;
                },
              )
            ],
          ),
        );
      },
    );
  }
}
