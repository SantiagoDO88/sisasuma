import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/style.dart';

import 'package:uma/presentation/pages/rutero/pages/historico_ventas/historico_ventas_controller.dart';

class ExcelTabRepuestos extends StatelessWidget {
  const ExcelTabRepuestos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<HistoricoVentasController>(
      builder: (historicoVentasController) {
        return Expanded(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                              headingRowHeight: Get.height * 0.065,
                              dataRowHeight: Get.height * 0.065,
                              columnSpacing: 25,
                              columns: historicoVentasController
                                  .getColumnsTableRepuesto(),
                              rows: historicoVentasController
                                  .getRowsTableRepuesto()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "\$ ${historicoVentasController.valorTotalRespuestos.value}",
                      style: TextStyles.subtitleStyle(color: kGrayTitle).copyWith(
                        fontSize: Get.textScaleFactor * 25,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

                      
                      // List<DataRow>.generate(
                      //   10,
                      //   (int index) => DataRow(
                      //     color: MaterialStateProperty.resolveWith<Color?>(
                      //         (Set<MaterialState> states) {
                      //       if (index.isEven) return kPrimaryGrey;
                      //       return null;
                      //     }),
                      //     cells: <DataCell>[
                      //       DataCell(
                      //         Text('2022',
                      //             style: TextStyles.bodyStyle(
                      //                 color: kGraySubtitle, isBold: true),
                      //             overflow: TextOverflow.ellipsis),
                      //       ),
                      //       DataCell(
                      //         Text(
                      //           'Enero',
                      //           style: TextStyles.bodyStyle(
                      //               color: kGraySubtitle, isBold: true),
                      //         ),
                      //       ),
                      //       DataCell(
                      //         Text(
                      //           '100.000.000',
                      //           style: TextStyles.bodyStyle(
                      //               color: kGraySubtitle, isBold: true),
                      //         ),
                      //       ),
                      //       DataCell(
                      //         Padding(
                      //           padding: EdgeInsets.symmetric(
                      //               vertical: Get.height * 0.015),
                      //           child: CustomButton(
                      //             placeHolder: 'Detalle',
                      //             onPressed: () {
                      //               historicoVentasController
                      //                   .setRepuestosDetails();
                      //             },
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                    
