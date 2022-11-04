import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/pages/rutero/pages/cartera/cartera_controller.dart';


class TableCartera extends StatelessWidget {
  const TableCartera({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarteraController>(builder: (carteraController) {
      return DataTable(
        columns: [
          DataColumn(
              label: Text("Edad",
                  textAlign: TextAlign.center,
                  style: TextStyles.bodyStyle(isBold: true))),
          DataColumn(
              label: Text("Valor",
                  textAlign: TextAlign.center,
                  style: TextStyles.bodyStyle(isBold: true))),
        ],
        rows: [
          DataRows("Todos",carteraController.cartera!.carteraTotal),
          DataRows("1 - 15 dias",carteraController.cartera!.edad115),
          DataRows("16 - 30 dias",carteraController.cartera!.edad1630),
          DataRows("31 - 45 dias",carteraController.cartera!.edad3145),
          DataRows("46 - 60 dias",carteraController.cartera!.edad4660),
          DataRows("61 - 75 dias",carteraController.cartera!.edad6175),
        ],
      );
    });
  }

  DataRow DataRows(String rangeEdad, double? valor) {
    return DataRow(cells: <DataCell>[
          DataCell(Text(rangeEdad)),
          DataCell(Text("$valor"))
        ]);
  }
}
