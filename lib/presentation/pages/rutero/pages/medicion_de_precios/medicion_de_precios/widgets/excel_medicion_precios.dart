import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios/medicion_precios_controller.dart';

class ExcelMedicionPrecios extends StatelessWidget {
  const ExcelMedicionPrecios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<MedicionPreciosController>(
        builder: (historicoVentasController) {
      return Expanded(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      columns:
                          historicoVentasController.getColumnsTable(),
                      rows: historicoVentasController.getRowsTable()),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

