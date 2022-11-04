import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/colors.dart';
import 'package:uma/presentation/common/style/text_styles.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:uma/presentation/pages/home/home_controller.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) => Expanded(
        flex: 6,
        child: SizedBox(
          width: Get.width,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: EdgeInsets.all(Get.height * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularPercentIndicator(
                    backgroundColor: kPrimaryGrey,
                    reverse: true,
                    radius: Get.width * 0.23,
                    lineWidth: Get.width * 0.065,
                    animation: true,
                    percent: 0.65,
                    center: Text("65 %",
                        style: TextStyles.titleStyle(
                                color: kPrimaryRed, isBold: true)
                            .copyWith(fontSize: Get.textScaleFactor * 30)),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: kPrimaryRed,
                  ),
                  SizedBox(height: Get.height * 0.02),
                  ListTile(
                    visualDensity:
                        const VisualDensity(horizontal: 0, vertical: -4),
                    horizontalTitleGap: -15,
                    leading: CircleAvatar(
                        backgroundColor: kPrimaryRed,
                        radius: Get.height * 0.01),
                    title: Text("Clientes a visitar",
                        style: TextStyles.bodyStyle()),
                    trailing: Text("35", style: TextStyles.bodyStyle()),
                  ),
                  ListTile(
                    visualDensity:
                        const VisualDensity(horizontal: 0, vertical: -4),
                    horizontalTitleGap: -15,
                    leading: CircleAvatar(
                        backgroundColor: kPrimaryGrey,
                        radius: Get.height * 0.01),
                    title: Text("Clientes visitados",
                        style: TextStyles.bodyStyle()),
                    trailing: Text("36", style: TextStyles.bodyStyle()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
