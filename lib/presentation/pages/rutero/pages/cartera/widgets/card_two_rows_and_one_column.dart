import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/pages/rutero/pages/cartera/cartera_controller.dart';

class CardTwoRowsAndOneColumn extends StatelessWidget {
  const CardTwoRowsAndOneColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarteraController>(builder: (carteraController) {
      return SizedBox(
        height: Get.height * 0.16,
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            color: kPrimaryGrey,
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Table(
                      border: const TableBorder(
                          verticalInside: BorderSide(
                              width: 1,
                              color: kGrayHints,
                              style: BorderStyle.solid)),
                      children: [
                        TableRow(children: [
                          Text(
                              carteraController.cartera == null
                                  ? '\$000.000'
                                  : "${carteraController.cartera!.carteraVencida}",
                              textAlign: TextAlign.center,
                              style: TextStyles.titleStyle2(isBold: true)),
                          Text(
                              carteraController.cartera == null
                                  ? "\$00.000"
                                  : "${carteraController.cartera!.carteraPorVencer}",
                              textAlign: TextAlign.center,
                              style: TextStyles.titleStyle2(isBold: true)),
                        ]),
                        TableRow(children: [
                          Text('Cartera Vencida',
                              textAlign: TextAlign.center,
                              style: TextStyles.bodyStyle()),
                          Text('Cartera Por Vencer',
                              textAlign: TextAlign.center,
                              style: TextStyles.bodyStyle()),
                        ]),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Cupo Disponible:",
                        style: TextStyles.bodyStyle(color: kPrimaryBlack),
                      ),
                      Text(
                        carteraController.cartera == null
                            ? "\$0.000.000"
                            : "${carteraController.cartera!.carteraTotal}",
                        style: TextStyles.titleStyle2(isBold: true),
                      )
                    ],
                  ),
                ]))),
      );
    });
  }
}
