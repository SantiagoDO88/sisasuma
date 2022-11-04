import 'package:get/get.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios_finalizar/medicion_precios_finalizar_controller.dart';

class MedicionPreciosFinalizarBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MedicionPreciosFinalizarController(), fenix: true);
  }
}