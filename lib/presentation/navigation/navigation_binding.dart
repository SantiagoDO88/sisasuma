import 'package:get/get.dart';
import 'package:uma/presentation/navigation/navigation_controller.dart';
import 'package:uma/presentation/pages/rutero/pages/detalles_rutero/detalles_rutero_controller.dart';
import 'package:uma/presentation/pages/rutero/pages/historico_ventas/historico_ventas_controller.dart';
import 'package:uma/presentation/pages/home/home_controller.dart';
import 'package:uma/presentation/pages/rutero/pages/seguimiento_planes/pages/seguimiento_planes_general/seguimiento_planes_controller.dart';
import 'package:uma/presentation/pages/rutero/rutero_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => RuteroController(), fenix: true);
    Get.lazyPut(() => DetallesRuteroController(), fenix: true);
    Get.lazyPut(() => HistoricoVentasController(), fenix: true);
    Get.lazyPut(() => SeguimientoPlanesController(), fenix: true);
  }
}
