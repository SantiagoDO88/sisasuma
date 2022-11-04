import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/pages/rutero/pages/cartera/cartera_controller.dart';

class CardNameAndCode extends StatelessWidget {
  const CardNameAndCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarteraController>(builder: (carteraController) {
      return SizedBox(
        height: Get.height * 0.085,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          color: kPrimaryRed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "La Rosa De Guadalupe",
                style: TextStyles.titleStyle(color: kPrimaryWhite),
              ),
              SizedBox(
                width: Get.width * 0.02,
              ),
              Text(
                  carteraController.cartera == null
                      ? "000000000"
                      : "${carteraController.cartera!.cliente}",
                  style: TextStyles.titleStyle(color: kPrimaryBlack))
            ],
          ),
        ),
      );
    });
  }
}
