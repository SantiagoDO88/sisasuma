import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/colors.dart';
import 'package:uma/presentation/common/style/text_styles.dart';
import 'package:uma/presentation/pages/home/widgets/daily_cards.dart';
import 'package:uma/presentation/pages/home/widgets/statistics.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Get.height * 0.02, horizontal: Get.height * 0.025),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StartOrFinishDayCards(),
          Padding(
            padding: EdgeInsets.fromLTRB(
                Get.width * 0.065, Get.height * 0.015, 0, Get.height * 0.015),
            child: Text("Tus estadísticas",
                style: TextStyles.titleStyle2(color: kGraySubtitle)),
          ),
          const Statistics(),
        ],
      ),
    );
  }
}
