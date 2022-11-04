import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/style.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03,vertical: Get.height*0.01),
        child: Text(
          "Nueva Medicion",
          style: TextStyles.titleStyle2(color: kGraySubtitle),
        ),
      ),
    );
  }
}
