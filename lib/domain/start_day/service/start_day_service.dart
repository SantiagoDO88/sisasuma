import 'package:uma/domain/start_day/interface/start_day_interface.dart';
import 'package:uma/domain/start_day/model/start_day.dart';

class StartDayService {
  final StartDayInterface startDayInterface;

  StartDayService({required this.startDayInterface});

  Future<bool> hasAlreadyStartedHisDay(){
    return startDayInterface.hasAlreadyStartedHisDay();
  }
  Future<bool> saveDayStart(StartDay startDay){
    return startDayInterface.saveDayStart(startDay);
  }
}