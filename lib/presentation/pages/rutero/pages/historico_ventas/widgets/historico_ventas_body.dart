import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/pages/rutero/pages/historico_ventas/historico_ventas_controller.dart';
import 'package:uma/presentation/pages/rutero/pages/historico_ventas/widgets/card_info.dart';
import 'package:uma/presentation/pages/rutero/pages/historico_ventas/widgets/excel_tab_repuestos.dart';
import 'package:uma/presentation/pages/rutero/pages/historico_ventas/widgets/excel_tab_repuestos_detail.dart';
import 'package:uma/presentation/pages/rutero/pages/historico_ventas/widgets/excel_tab_vehiculos.dart';
import 'package:uma/presentation/pages/rutero/pages/historico_ventas/widgets/excel_tab_vehiculos_detail.dart';
import 'package:uma/presentation/pages/rutero/pages/historico_ventas/widgets/toggle_button.dart';

class HistoricoVentasBody extends StatelessWidget {
  const HistoricoVentasBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HistoricoVentasController>(
      builder: (historicoVentasController) {
        String tabController = historicoVentasController.tabController.value;
        String detailController =
            historicoVentasController.detailController.value;
        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: Get.height * 0.02, horizontal: Get.height * 0.025),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CardInfo(),
              SizedBox(
                height: Get.height * 0.02,
              ),
              const ToggleButton(),
              //SizedBox(
              //  height: Get.height * 0.03,
              //),
              //Padding(
              //  padding: EdgeInsets.symmetric(horizontal: Get.height * 0.01),
              //  child: const SearchFilter(),
              //),
              SizedBox(
                height: Get.height * 0.02,
              ),
              if (tabController == "repuestos") const ExcelTabRepuestos(),
              if (tabController == "vehiculos") const ExcelTabVehiculos(),
              if (detailController == "repuestosDetail")
                const ExcelTabRepuestosDetail(),
              if (detailController == "vehiculosDetail")
                const ExcelTabVehiculosDetail(),
            ],
          ),
        );
      },
    );
  }
}
