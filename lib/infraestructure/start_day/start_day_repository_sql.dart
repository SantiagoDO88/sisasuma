import 'package:uma/domain/start_day/interface/start_day_interface.dart';
import 'package:uma/domain/start_day/model/start_day.dart';
import 'package:uma/infraestructure/services/local/sql/start_day_sql_service.dart';

class StartDayrepositorySql implements StartDayInterface{
  
  
  @override
  Future<bool> hasAlreadyStartedHisDay() {
    return StartDaySqlService.hasAlreadyStartedHisDay();
  }

  @override
  Future<bool> saveDayStart(StartDay startDay) {
   return StartDaySqlService.saveDayStart(startDay);
  }

}