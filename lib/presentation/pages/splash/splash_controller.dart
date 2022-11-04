import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:uma/infraestructure/services/local/session/session_interface.dart';
import 'package:uma/infraestructure/services/local/session/session_service.dart';
import 'package:uma/infraestructure/services/local/sql/sql_util.dart';

import 'package:uma/config/routes/app_routes.dart';

class SplashController extends GetxController {
  final SessionInterface _sessionInterface = SessionService();

  Future<void> checkUserAuthenticationState() async {
    //box.remove("user");

    if (await _sessionInterface.thereIsAnUser()) {
      print(jsonEncode(_sessionInterface.getUser()));
    } else {
      print("No hay usuario");
    }

    // await 3.seconds.delay();
    final bool isUserAuthenticated = await _sessionInterface.thereIsAnUser();

    if (!isUserAuthenticated) return Get.offAndToNamed(AppRoutes.login);

    final bool isDataBaseZipDownloaded = await downloadDataBaseZip();

    print("isDataBaseZipDownloaded in splash: $isDataBaseZipDownloaded");

    if (isUserAuthenticated && isDataBaseZipDownloaded) {
      Get.offAndToNamed(AppRoutes.navigation);
    }
    // if (isUserAuthenticated) {
    //   Get.offAndToNamed(AppRoutes.navigation);
    // }
  }

  Future<bool> downloadDataBaseZip() async {
    return await SqlUtil.sqlUtil.downloadZip();
  }
}
