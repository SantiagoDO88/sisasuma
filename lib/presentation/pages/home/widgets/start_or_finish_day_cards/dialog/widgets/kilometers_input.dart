import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/pages/home/home_controller.dart';

import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/common/widgets/widgets.dart';

class KilometersInput extends StatelessWidget {
  const KilometersInput({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Registrar kilometraje",
              style: TextStyles.titleStyle2(
                color: kGraySubtitle,
              ).copyWith(
                fontFamily: 'OpenSans',
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Row(
              children: [
                Image(
                  image: const AssetImage('assets/icons/KMH.png'),
                  height: Get.height * 0.12,
                ),
                SizedBox(width: Get.width * 0.04),
                Expanded(
                  child: CustomTextFieldDialog(
                    numeric: true,
                    textEditingController: homeController.kilometersInput,
                    hint: "Km Actual",
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}