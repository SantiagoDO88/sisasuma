import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/pages/rutero/pages/cartera/cartera_controller.dart';

class CardCupo extends StatelessWidget {
  const CardCupo({
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
          color: kPrimaryGrey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Cupo:",
                style: TextStyles.bodyStyle(color: kPrimaryBlack),
              ),
              Text(
                carteraController.cartera == null
                    ? "\$0.000.000"
                    : "${carteraController.cartera!.cupo}",
                style: TextStyles.titleStyle2(isBold: true),
              )
            ],
          ),
        ),
      );
    });
  }
}
