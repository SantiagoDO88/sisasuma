import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/text_styles.dart';
import 'package:uma/presentation/pages/rutero/pages/cartera/cartera_controller.dart';
import 'package:uma/presentation/pages/rutero/pages/cartera/widgets/card_cupo.dart';
import 'package:uma/presentation/pages/rutero/pages/cartera/widgets/card_name_and_code.dart';
import 'package:uma/presentation/pages/rutero/pages/cartera/widgets/card_two_rows_and_one_column.dart';
import 'package:uma/presentation/pages/rutero/pages/cartera/widgets/table_cartera.dart';


class CarteraPagebody extends StatelessWidget {
  const CarteraPagebody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarteraController>(builder: (carteraController) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: carteraController.getCarteraClient(carteraController.codigoCliente),
          builder: ((context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) return const Text("error");
            if (snapshot.hasData) return body(carteraController);
            return Container();
          }),
        ),
      );
    });
  }

  SingleChildScrollView body(CarteraController carteraController) {
    return SingleChildScrollView(
      child: Column(
              children: [
                //LABEL
                labelCartera(),
    
                //CARD 1
                const CardNameAndCode(),
    
                //CARD 2
                const CardCupo(),
    
                //CARD 3
                const CardTwoRowsAndOneColumn(),
    
                ///DROPDOWN BUTTON
                //const DropDownCarteraPage(),
    
                //TABLE
                const TableCartera()
              ],
            ),
    );
  }

  Padding labelCartera() {
    return Padding(
      padding: EdgeInsets.only(left: Get.width * 0.05, top: Get.height * 0.05),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Cartera",
            style: TextStyles.titleStyle2(color: Colors.grey),
            textAlign: TextAlign.start,
          )),
    );
  }
}
