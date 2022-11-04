import 'package:get/get.dart';
import 'package:uma/presentation/pages/rutero/pages/cartera/cartera_controller.dart';


class CarteraBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CarteraController(), fenix: true);
  }
}
