import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/pages/home/home_controller.dart';

import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/pages/home/widgets/start_or_finish_day_cards/dialog/start_or_finish_day_dialog.dart';


class StartOrFinishDayCard extends StatelessWidget {
  final bool toFinishDay;
  const StartOrFinishDayCard({super.key, this.toFinishDay = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homController) {
        return InkWell(
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onTap: () => startOrFinishDayDialog(context),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: EdgeInsets.all(Get.height * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage('assets/icons/red_clock.png'),
                    height: Get.height * 0.040,
                  ),
                  SizedBox(height: Get.height * 0.0005),
                  Text(
                    toFinishDay ? 'Finalizar' : 'Iniciar',
                    style: TextStyles.bodyStyle(),
                  ),
                  Text(
                    'Día',
                    style: TextStyles.bodyStyle(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}