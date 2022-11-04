import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:uma/config/routes/app_routes.dart';
import 'package:uma/domain/auth/model/auth_user.dart';
import 'package:uma/domain/rutero/medicion_precio/models/marca.dart';
import 'package:uma/domain/rutero/medicion_precio/models/medicion_precio.dart';
import 'package:uma/domain/rutero/medicion_precio/models/medicion_precio_temp.dart';
import 'package:uma/domain/rutero/medicion_precio/models/modelo.dart';
import 'package:uma/domain/rutero/medicion_precio/services/medicion_precio_service.dart';
import 'package:uma/infraestructure/rutero/medicion_precios/medicion_precios_repository_sql.dart';
import 'package:uma/presentation/pages/home/home_controller.dart';
import 'package:uma/presentation/pages/rutero/pages/detalles_rutero/detalles_rutero_controller.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_finalizar/medicion_precios_finalizar_binding.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_finalizar/medicion_precios_finalizar_controller.dart';

class MedicionPreciosAgregarController extends GetxController {
  final MedicionPrecioService _medicionPrecioService = MedicionPrecioService(
      MedicionPrecioInterface: MedicionPreciosRepositorySql());

  RxList<Marca> listMarcas = <Marca>[].obs;

  RxList<Modelo> listModelos = <Modelo>[].obs;

  Rx<Marca?> selectValueMarca = (null as Marca?).obs;

  Rx<Modelo?> selectValueModelo = (null as Modelo?).obs;

  final precioController = TextEditingController();

  final DetallesRuteroController _detallesRuteroController = Get.find();

  final _storage = GetStorage();

  RxString jsonMedicionEdit = "".obs;

  MedicionPrecio medicionPrecioEdit= MedicionPrecio();

  @override
  void onInit() async {
//Get.delete<YourController>();
    await getListMarcas();
    jsonMedicionEdit.value = _storage.read('medicionEdit') ?? "";
    if (jsonMedicionEdit.isNotEmpty) {
      medicionPrecioEdit =
          MedicionPrecio.fromJson(jsonMedicionEdit.value);

      precioController.text = medicionPrecioEdit.precio.toString();

      selectValueMarca.value = listMarcas
          .where((p0) => p0.codigo == medicionPrecioEdit.codMarcaMedicion)
          .first;

      await getListModelosDependMarca();

      //selectValueMarca.value=null;
      // =

//
      selectValueModelo.value = listModelos
          .where(
              (p0) => p0.codigoMedicion == medicionPrecioEdit.idModeloMedicion)
          .first;
    }

    super.onInit();
  }

  void dropdownChangeMarca(Marca newValue) async {
    selectValueMarca.value = newValue;
    selectValueModelo.value = null;
    await getListModelosDependMarca();
  }

  void dropdownChangeModelo(Modelo newValue) =>
      selectValueModelo.value = newValue;

  Future<List<Marca>> getListMarcas() async =>
      listMarcas.value = await _medicionPrecioService.getListMarcas();

  Future<List<Modelo>> getListModelosDependMarca() async =>
      listModelos.value = await _medicionPrecioService
          .getListModelosDependMarca(selectValueMarca.value!.codigo!);

  void saveMedicion() async {
    if (selectValueMarca.value == null ||
        selectValueModelo.value == null ||
        precioController.text.isEmpty) {
      //TODO alert mensaje:"Rellene los campos adecuadamente"
      print("entro 1");
      return;
    }

    Marca marca = selectValueMarca.value!;
    Modelo modelo = selectValueModelo.value!;
    AuthUser user = HomeController().getUser();

    String date = DateFormat("yyyyMMddHmss").format(DateTime.now()).toString();
    String date2 = DateFormat("yyyy-MM-dd").format(DateTime.now()).toString();

    MedicionPrecioTemp medicion = MedicionPrecioTemp(
        codMarcaMedicion: marca.codigo,
        idModeloMedicion: modelo.codigoMedicion,
        precio: double.parse(precioController.text),
        numDoc: "A$date",
        codigoCliente: _detallesRuteroController.selectedRutero.codigoCliente,
        codigoProveedor: user.codigoProveedor,
        codigoUsuarioSys: user.codigoUsuario.toString(),
        //TODO preguntar como es con las fechas
        fechaMovil: date2,
        fechaServidor: date2);
    await _medicionPrecioService.saveMedicionPrecio(medicion);

    //TODO MENSAJE SE AGREGO O NO Se agrego

    Get.offAndToNamed(AppRoutes.medicionPreciosFinalizar);
  }

  void editarMedicion() async {
    if (selectValueMarca.value == null ||
        selectValueModelo.value == null ||
        precioController.text.isEmpty) {
      //TODO alert mensaje:"Rellene los campos adecuadamente"
      print("entro 1");
      return;
    }

    Marca marca = selectValueMarca.value!;
    Modelo modelo = selectValueModelo.value!;
    String date2 = DateFormat("yyyy-MM-dd").format(DateTime.now()).toString();

    MedicionPrecioTemp medicion = MedicionPrecioTemp(
        numDoc: medicionPrecioEdit.numDoc,
        codMarcaMedicion: marca.codigo,
        idModeloMedicion: modelo.codigoMedicion,
        precio: double.parse(precioController.text),
        fechaMovil: date2,
        fechaServidor: date2);

    await _medicionPrecioService.editMedicionPrecio(medicion);

    Get.offAndToNamed(AppRoutes.medicionPreciosFinalizar);
  }


}
