import 'package:get/get.dart';

import 'package:uma/presentation/pages/rutero/pages/historico_ventas/historico_ventas_controller.dart';
import 'package:uma/presentation/pages/login/login_controller.dart';
import 'package:uma/presentation/pages/rutero/rutero_controller.dart';
import 'package:uma/presentation/pages/splash/splash_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);

  }
}
