import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/common/widgets/widgets.dart';

class GestionInventarioController extends GetxController {
  final emailController = TextEditingController();

  RxList<String> listGestionInventario = <String>[].obs;
  RxList<String> listColumnTableRepuestos = <String>[
    "Modelo",
    "Color",
    "VIN",
    "Año modelo",
    "Existe",
    "Detalle",
  ].obs;

  RxList<String> listResultadoInventarioMix = <String>[].obs;
  RxList<String> listColumnResultadoInventarioMix = <String>[
    "Modelo",
    "Color",
    "Cantidad\nexistente",
    "Cantidad\nmodelo MIX",
    "Cumple",
  ].obs;

  List<DataColumn> getColumnsTableGestionInventario() =>
      listColumnTableRepuestos.value
          .map(
            (String element) => DataColumn(
              label: Center(
                child: Text(
                  element,
                  textAlign: TextAlign.center,
                  style: TextStyles.bodyStyle(isBold: true),
                ),
              ),
            ),
          )
          .toList();

  List<DataRow> getRowsTableGestionInventario() =>
      listGestionInventario.value.map((element) {
        var cell = ["sisas", "nonas", "sisas", "existe"];
        return DataRow(cells: getCellGestionInventario(element, cell));
      }).toList();

  List<DataCell> getCellGestionInventario(String object, List<dynamic> cells) =>
      cells.map((element) {
        if (element == "existe") {
          return DataCell(
            Padding(
              padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
              child: CustomButton(
                placeHolder: 'Detalle',
                onPressed: () async {},
              ),
            ),
          );
        }
        return DataCell(
          Center(
            child: Text("nonas",
                style: TextStyles.bodyStyle(color: kGraySubtitle, isBold: true),
                overflow: TextOverflow.ellipsis),
          ),
        );
      }).toList();

  List<DataColumn> getColumnsTableResultadoInventarioMix() =>
      listColumnResultadoInventarioMix.value
          .map(
            (String element) => DataColumn(
              label: Center(
                child: Text(
                  element,
                  textAlign: TextAlign.center,
                  style: TextStyles.bodyStyle(isBold: true),
                ),
              ),
            ),
          )
          .toList();

  List<DataRow> getRowsTableResultadoInventarioMix() =>
      listResultadoInventarioMix.value.map((element) {
        var cell = ["sisas", "nonas", "sisas", "existe"];
        return DataRow(cells: getCellGestionInventario(element, cell));
      }).toList();

  List<DataCell> getCellResultadoInventarioMIx(
          String object, List<dynamic> cells) =>
      cells.map((element) {
        if (element == "existe") {
          return DataCell(
            Padding(
              padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
              child: CustomButton(
                placeHolder: 'Detalle',
                onPressed: () async {},
              ),
            ),
          );
        }
        return DataCell(
          Center(
            child: Text("nonas",
                style: TextStyles.bodyStyle(color: kGraySubtitle, isBold: true),
                overflow: TextOverflow.ellipsis),
          ),
        );
      }).toList();
}
