import 'package:get/get.dart';
import 'package:uma/presentation/pages/rutero/pages/medicion_de_precios/medicion_de_precios/medicion_precios_controller.dart';

class MedicionPreciosBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MedicionPreciosController(), fenix: true);
  }
}