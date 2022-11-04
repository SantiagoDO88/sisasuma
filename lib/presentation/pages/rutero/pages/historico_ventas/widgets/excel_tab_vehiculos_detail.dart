import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/pages/rutero/pages/historico_ventas/historico_ventas_controller.dart';

class ExcelTabVehiculosDetail extends StatelessWidget {
  const ExcelTabVehiculosDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<HistoricoVentasController>(
      builder: (historicoVentasController) {
        return Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        headingRowHeight: Get.height * 0.065,
                        dataRowHeight: Get.height * 0.065,
                        columnSpacing: 25,
                        columns: historicoVentasController
                            .getColumnsTableVehiculoDetalle(),
                        rows: historicoVentasController
                            .getRowsTableVehiculoDetalle()),
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
