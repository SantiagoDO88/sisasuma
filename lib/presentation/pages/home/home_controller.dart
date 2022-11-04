import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/domain/start_day/service/start_day_service.dart';

import 'package:uma/domain/auth/model/auth_user.dart';
import 'package:uma/domain/start_day/model/start_day.dart';

import 'package:uma/infraestructure/services/local/session/session_interface.dart';
import 'package:uma/infraestructure/start_day/start_day_repository_sql.dart';
import 'package:uma/infraestructure/services/local/session/session_service.dart';
import 'package:uma/infraestructure/utils/date_formater.dart';
import 'package:uma/infraestructure/utils/uid_generator.dart';

class HomeController extends GetxController {
  final StartDayService _startDayService =
      StartDayService(startDayInterface: StartDayrepositorySql());

  final SessionInterface _sessionInterface = SessionService();

  RxBool hasAlreadyStartedHisDay = false.obs;

  final kilometersInput = TextEditingController();

  final picNameController = TextEditingController();

  late AuthUser user;

  late StartDay startDay;

  @override
  void onInit() {
    user = getUser();
    hasAlreadyStarted();
    super.onInit();
  }

  AuthUser getUser() {
    return _sessionInterface.getUser();
    // print(jsonEncode(await _sessionInterface.getUser()));
  }

  Future<void> hasAlreadyStarted() async {
    hasAlreadyStartedHisDay.value =
        await _startDayService.hasAlreadyStartedHisDay();
  }

  void saveDayStart() async {
    createStartDayEntity();
    bool savedOnTemporal = await _startDayService.saveDayStart(startDay);
    if(savedOnTemporal){
      print("SIIIII");
      hasAlreadyStartedHisDay(true);
    }
    else{
      print("NOOOOO");
    }
  }

  void createStartDayEntity(){
    startDay = StartDay(
      codigoUsuario: user.codigoUsuario.toString(),
      fecha: DateFormater.getExactDateTime(),
      imei: user.codigoUsuario.toString(),
      version: "0.0.1",
      codigoProveedor: user.codigoProveedor,
      fechaCons: 0,
      kmInicial: int.parse(kilometersInput.text),
      idFotoKm: UidGenerator.fotoUid()
    );

    print(jsonEncode(startDay));
  }



}


  // Future<bool>hasAlreadyStartedHisDay(){
  //   return _startDayService.hasAlreadyStartedHisDay();
  // }