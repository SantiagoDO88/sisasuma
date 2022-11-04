import 'package:get/get.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_agregar/medicion_precios_agregar_controller.dart';

class MedicionPreciosAgregarBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MedicionPreciosAgregarController(), fenix: true);
  }
}