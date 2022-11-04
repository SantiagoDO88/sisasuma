import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/common/widgets/widgets.dart';
import 'package:uma/presentation/pages/rutero/pages/historico_ventas/historico_ventas_controller.dart';

class ExcelTabVehiculos extends StatelessWidget {
  const ExcelTabVehiculos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<HistoricoVentasController>(
      builder: (historicoVentasController) {
        return Expanded(
          child: Column(
            children: [
              Expanded(
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
                                  .getColumnsTableVehiculo(),
                              rows: historicoVentasController
                                  .getRowsTableVehiculo()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "${historicoVentasController.cantidadTotalVehiculos.value}",
                      style:
                          TextStyles.subtitleStyle(color: kGrayTitle).copyWith(
                        fontSize: Get.textScaleFactor * 25,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
