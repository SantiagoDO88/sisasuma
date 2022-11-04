import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/style.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          Get.width * 0.065, Get.height * 0.015, 0, Get.height * 0.030),
      child: Text(
        "Medicion De Precios",
        style: TextStyles.titleStyle2(color: kGraySubtitle),
      ),
    );
  }
}
