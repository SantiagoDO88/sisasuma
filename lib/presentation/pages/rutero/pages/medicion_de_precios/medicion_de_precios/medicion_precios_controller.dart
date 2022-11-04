import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uma/domain/rutero/general/models/rutero_with_cliente.dart';
import 'package:uma/domain/rutero/medicion_precio/models/medicion_precio.dart';
import 'package:uma/domain/rutero/medicion_precio/services/medicion_precio_service.dart';
import 'package:uma/infraestructure/rutero/medicion_precios/medicion_precios_repository_sql.dart';
import 'package:uma/presentation/common/style/colors.dart';
import 'package:uma/presentation/common/style/text_styles.dart';
import 'package:uma/presentation/common/widgets/custom_button.dart';
import 'package:uma/presentation/pages/rutero/pages/detalles_rutero/detalles_rutero_controller.dart';

class MedicionPreciosController extends GetxController {
  final MedicionPrecioService _medicionPrecioService = MedicionPrecioService(
      MedicionPrecioInterface: MedicionPreciosRepositorySql());

  RxString searchText = "".obs;

  final RxString selectedAction = 'Acciones'.obs;

  RxList<String> listColumnTable = <String>["Marca", "Modelo", "Precios"].obs;

  RxList<MedicionPrecio?> listMedicionPrecio = <MedicionPrecio>[].obs;

  final DetallesRuteroController _detallesRuteroController = Get.find();

  final _storage = GetStorage();

  @override
  void onInit() async {
    RuteroWithCliente detalleRutero = _detallesRuteroController.selectedRutero;

    listMedicionPrecio.value = await _medicionPrecioService
        .getListMedicionesPrecios(detalleRutero.codigo!);
    _storage.write('medicionEdit', null);
    super.onInit();
  }

  List<DataColumn> getColumnsTable() => listColumnTable.value
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

  List<DataRow> getRowsTable() => listMedicionPrecio.value.map((element) {
        var cell = [
          element!.descripcionMarca,
          element.descripcion,
          element.precio

          // element!.codigoProducto,
          // element.mes,
          // "\$ ${element.valorVentaMesTotal}",
          // "event"wwwwwdw
        ];
        return DataRow(cells: getCell(element, cell));
      }).toList();

  List<DataCell> getCell(MedicionPrecio object, List<dynamic> cells) =>
      cells.map((element) {
        // if (element == "event") {
        //   return DataCell(Padding(
        //       padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
        //       child: Checkbox(
        //           value: object.isSelectedCheck, onChanged: (bool? value) {
        //             return null;
        //             }
        //             )));
        // }

        return DataCell(
          Center(
            child: Text('$element',
                style: TextStyles.bodyStyle(color: kGraySubtitle, isBold: true),
                overflow: TextOverflow.ellipsis),
          ),
        );
      }).toList();
}
