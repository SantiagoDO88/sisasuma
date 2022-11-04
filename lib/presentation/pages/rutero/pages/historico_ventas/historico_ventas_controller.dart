import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/domain/rutero/historico_ventas/models/repuesto.dart';
import 'package:uma/domain/rutero/historico_ventas/models/vehiculo.dart';
import 'package:uma/domain/rutero/historico_ventas/service/historico_ventas_service.dart';
import 'package:uma/infraestructure/rutero/historico_ventas/historico_ventas_repository.dart';
import 'package:uma/presentation/common/style/colors.dart';
import 'package:uma/presentation/common/style/text_styles.dart';
import 'package:uma/presentation/common/widgets/custom_button.dart';

class HistoricoVentasController extends GetxController {
  final HistoricoVentasService _historicoVentasService = HistoricoVentasService(
      historicoVentasInterface: HistoricoVentasRepositorySql());

  RxString searchText = "".obs;

  RxString tabController = "repuestos".obs;
  RxString detailController = "".obs;
  RxDouble changeButtonColor = (-1.0).obs;
  //Repuestos
  RxDouble valorTotalRespuestos = 0.0.obs;
  RxInt cantidadTotalVehiculos = 0.obs;

  RxList<Repuesto?> listRepuestos = <Repuesto>[].obs;
  RxList<String> listColumnTableRepuestos =
      <String>["Año", "Mes", "Venta", ""].obs;
  RxList<Repuesto?> listRepuestosDetalle = <Repuesto>[].obs;
  RxList<String> listColumnTableRepuestosDetalle =
      <String>["Material", "Descripción", "Valor"].obs;

  //Vehiculo
  RxList<Vehiculo?> listVehiculos = <Vehiculo>[].obs;
  RxList<String> listColumnTableVehiculo =
      <String>["Año", "Mes", "Cantidad", ""].obs;
  RxList<Vehiculo?> listVehiculosDetalle = <Vehiculo>[].obs;
  RxList<String> listColumnTableVehiculosDetalle =
      <String>["Material", "Descripción", "Valor"].obs;

  String codigoCliente = "10001047";
  //RxString codigoCLient= "".obs;

  @override
  void onInit() async {
    listRepuestos.value =
        await _historicoVentasService.getListHistoricoRespuestos(codigoCliente);

    calculateValorTotalRepuesto();

    listVehiculos.value =
        await _historicoVentasService.getListHistoricoVehiculos(codigoCliente);

    calculateCantidadTotalVehiculos();

    super.onInit();
  }

  //Function Repuesto
  void calculateValorTotalRepuesto() {
    for (var repuesto in listRepuestos) {
      valorTotalRespuestos.value += repuesto!.valorVentaMesTotal!;
    }
  }

  void calculateCantidadTotalVehiculos() {
    for (var vehiculo in listVehiculos) {
      cantidadTotalVehiculos.value += vehiculo!.cantidadMesTotal!.toInt();
    }
  }

  List<DataColumn> getColumnsTableRepuesto() => listColumnTableRepuestos.value
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

  List<DataRow> getRowsTableRepuesto() => listRepuestos.value.map((element) {
        var cell = [
          element!.anio,
          element.mes,
          "\$ ${element.valorVentaMesTotal}",
          "event"
        ];
        return DataRow(cells: getCellRepuesto(element, cell));
      }).toList();

  List<DataColumn> getColumnsTableRepuestoDetalle() =>
      listColumnTableRepuestosDetalle.value
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

  List<DataRow> getRowsTableRepuestoDetalle() =>
      listRepuestosDetalle.value.map((element) {
        var cell = [
          element!.codigoMaterial,
          element.descripcionMaterial,
          "\$ ${element.valorVenta}",
        ];
        return DataRow(cells: getCellRepuesto(element, cell));
      }).toList();

  List<DataCell> getCellRepuesto(Repuesto object, List<dynamic> cells) =>
      cells.map((element) {
        if (element == "event") {
          return DataCell(
            Padding(
              padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
              child: CustomButton(
                placeHolder: 'Detalle',
                onPressed: () async {
                  setRepuestosDetails();

                  listRepuestosDetalle.value = await _historicoVentasService
                      .getListHistoricoRespuestosPorMes(
                          codigoCliente, object.mes!);
                },
              ),
            ),
          );
        }

        return DataCell(
          Center(
            child: Text('$element',
                style: TextStyles.bodyStyle(color: kGraySubtitle, isBold: true),
                overflow: TextOverflow.ellipsis),
          ),
        );
      }).toList();

  //Function Vehiculo
  List<DataColumn> getColumnsTableVehiculo() => listColumnTableVehiculo.value
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

  List<DataColumn> getColumnsTableVehiculoDetalle() =>
      listColumnTableVehiculosDetalle.value
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

  List<DataRow> getRowsTableVehiculo() => listVehiculos.value.map((element) {
        var cell = [
          element!.anio,
          element.mes,
          element.cantidadMesTotal!.toInt(),
          "event"
        ];
        return DataRow(cells: getCellVehiculo(element, cell));
      }).toList();

  List<DataRow> getRowsTableVehiculoDetalle() =>
      listVehiculosDetalle.value.map((element) {
        var cell = [
          element!.codigoMaterial,
          element.descripcionMaterial,
          "\$ ${element.valorVentaMesActual}",
        ];
        return DataRow(cells: getCellVehiculo(element, cell));
      }).toList();

  List<DataCell> getCellVehiculo(Vehiculo vehiculo, List<dynamic> cells) =>
      cells.map((element) {
        if (element == "event") {
          return DataCell(
            Padding(
              padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
              child: CustomButton(
                placeHolder: 'Detalle',
                onPressed: () async {
                  setVehiculosDetails();
                  //TODO cargar el detalle

                  listVehiculosDetalle.value = await _historicoVentasService
                      .getListHistoricoVehiculosPorMes(
                          codigoCliente, vehiculo.mes!);
                },
              ),
            ),
          );
        }

        return DataCell(
          Center(
            child: Text('$element',
                style: TextStyles.bodyStyle(color: kGraySubtitle, isBold: true),
                overflow: TextOverflow.ellipsis),
          ),
        );
      }).toList();

  void cambiarRepuestos() {
    detailController.value = "";
    tabController.value = "repuestos";
    changeButtonColor.value = -1.0;
    update();
  }

  void cambiarVehiculos() {
    detailController.value = "";
    tabController.value = "vehiculos";
    changeButtonColor.value = 1.0;
    update();
  }

  setRepuestosDetails() {
    tabController.value = "";
    detailController.value = "repuestosDetail";
    update();
  }

  setVehiculosDetails() {
    tabController.value = "";
    detailController.value = "vehiculosDetail";
    update();
  }
}
