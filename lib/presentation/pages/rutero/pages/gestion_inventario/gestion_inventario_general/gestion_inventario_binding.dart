import 'package:get/get.dart';
import 'package:uma/presentation/pages/rutero/pages/gestion_inventario/gestion_inventario_general/gestion_inventario_controller.dart';

class GestionInventarioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GestionInventarioController(), fenix: true);
  }
}
