import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/helpers/pretty_strings.dart';
import 'package:uma/presentation/pages/home/home_controller.dart';
import 'package:uma/presentation/pages/home/widgets/start_or_finish_day_cards/start_or_finish_day_card.dart';


class StartOrFinishDayCards extends StatelessWidget {
  const StartOrFinishDayCards({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (homeController) {
        bool hasAlreadyStartedHisDay =
            homeController.hasAlreadyStartedHisDay.value;
        return Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Card(
                  //clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.all(Get.height * 0.04),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            PrettyStrings.getPrettyName(
                                homeController.user.nombre),
                            style: TextStyles.titleStyle(isBold: true)),
                        Text('¿Qué haremos hoy?', style: TextStyles.bodyStyle())
                      ],
                    ),
                  ),
                ),
              ),
              if (hasAlreadyStartedHisDay)
                const Expanded(child: StartOrFinishDayCard(toFinishDay: true))
              else
                const Expanded(child: StartOrFinishDayCard())
            ],
          ),
        );
      },
    );
  }
}


// FutureBuilder(
//                 future: homeController.hasAlreadyStartedHisDay(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasError) {
//                     return const Center(
//                         child: Text("Error obteniendo la data"));
//                   }

//                   if (snapshot.connectionState == ConnectionState.done &&
//                       snapshot.data == true) {
//                     return const FinishDayCard();
//                   }

//                   if (snapshot.connectionState == ConnectionState.done &&
//                       snapshot.data == false) {
//                     return const StartDayCard();
//                   }
//                   return const Center(child: CircularProgressIndicator());
//                 },
//               ),