import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/domain/auth/service/auth_user_service.dart';
import 'package:uma/infraestructure/auth/auth_user_api.dart';

import 'package:uma/config/routes/app_routes.dart';
import 'package:uma/infraestructure/services/local/sql/sql_util.dart';

class LoginController extends GetxController {
  final authUserService = AuthUserService(authUserInterface: AuthUserApi());

  final userController = TextEditingController();

  final passwordController = TextEditingController();

  void logUser() async {
    final bool validUser = await authUserService.isValidUser(
        userController.text.trim(), passwordController.text.trim());

    if(!validUser) return;
    
    final bool isDataBaseZipDownloaded = await downloadDataBaseZip();

    print("isDataBaseZipDownloaded in login: $isDataBaseZipDownloaded");

    if (validUser && isDataBaseZipDownloaded) {
      return Get.offAndToNamed(AppRoutes.navigation);
    }
  }

  Future<bool> downloadDataBaseZip() async {
    return await SqlUtil.sqlUtil.downloadZip();
  }
}
