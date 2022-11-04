import 'package:uma/domain/start_day/model/start_day.dart';

abstract class StartDayInterface {

  Future<bool> hasAlreadyStartedHisDay();
  Future<bool> saveDayStart(StartDay startDay);
}