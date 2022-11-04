import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:uma/config/initial_bindings.dart';
import 'package:uma/config/routes/app_pages.dart';

import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/pages/splash/splash_page.dart';

void main() async {
  await GetStorage.init();
  HttpOverrides.global = new MyHttpOverrides();
  // print(box.read('user'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UMA',
      theme: themeData(),
      home: const SplashPage(),
      initialBinding: InitialBindings(),
      getPages: AppPages.pages,
    );
  }

}

 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}