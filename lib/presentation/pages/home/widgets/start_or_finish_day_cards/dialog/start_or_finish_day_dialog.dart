import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/pages/home/home_controller.dart';
import 'package:uma/presentation/pages/home/widgets/start_or_finish_day_cards/dialog/widgets/dialog_title.dart';
import 'package:uma/presentation/pages/home/widgets/start_or_finish_day_cards/dialog/widgets/kilometers_input.dart';
import 'package:uma/presentation/pages/home/widgets/start_or_finish_day_cards/dialog/widgets/photo_input.dart';
import 'package:uma/presentation/pages/home/widgets/start_or_finish_day_cards/dialog/widgets/save_button.dart';




//RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
startOrFinishDayDialog(BuildContext context) async {
  return showDialog(
    barrierDismissible: true,
    context: context,
    builder: (_) {
      return GetBuilder<HomeController>(
        builder: (homeController) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Dialog(
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              insetPadding: const EdgeInsets.all(10),
              elevation: 10,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      DialogTitle(),
                      KilometersInput(),
                      PhotoInput(),
                      SaveButton(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}