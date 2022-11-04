import 'dart:convert';

import 'package:get/get.dart';
import 'package:uma/domain/rutero/general/models/rutero_with_cliente.dart';
import 'package:uma/domain/rutero/general/services/rutero_service.dart';
import 'package:uma/infraestructure/rutero/general/rutero_sql_repository.dart';
import 'package:uma/infraestructure/services/local/session/session_interface.dart';
import 'package:uma/infraestructure/services/local/session/session_service.dart';
import 'package:uma/infraestructure/utils/date_formater.dart';

class RuteroController extends GetxController {
  final RuteroService _ruteroService =
      RuteroService(ruteroInterface: RuteroRepositorySql());

  static final SessionInterface _sessionInterface = SessionService();

  RxString searchText = "".obs;

  final Map<String, int> weekDays = {
    "Lunes": 1,
    "Martes": 2,
    "Miércoles": 3,
    "Jueves": 4,
    "Viernes": 5,
    "Sábado": 6
  };

  final RxString selectedDay = 'Lunes'.obs;

  RxInt codigoDia = 1.obs;

  final RxBool isVisited = false.obs;

  RxList<RuteroWithCliente> listRutero = <RuteroWithCliente>[].obs;

  @override
  void onInit() async {
    setInitials();
    getRuteroList();
    super.onInit();
  }

  void searchRuteros(Object value) {
    selectedDay.value = value.toString();
    codigoDia.value = weekDays[value.toString()]!;
    getRuteroList();
  }

  void getRuteroList() async {
    listRutero.value =
        await _ruteroService.getListRutero(codigoDia.value, searchText.value);
  }

  void setRutero(RuteroWithCliente ruteroWithCliente) async {
    await _sessionInterface.setRutero(ruteroWithCliente);
    //print(jsonEncode(_sessionInterface.getRutero()));
  }

  setInitials() {
    codigoDia.value = DateFormater.getDayAsInt();
    selectedDay.value =
        weekDays.keys.firstWhere((day) => weekDays[day] == codigoDia.value);
  }
}
