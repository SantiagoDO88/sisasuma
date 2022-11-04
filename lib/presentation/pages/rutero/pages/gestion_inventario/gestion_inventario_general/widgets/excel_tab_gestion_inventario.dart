import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/pages/rutero/pages/gestion_inventario/gestion_inventario_general/gestion_inventario_controller.dart';


class ExcelTabGestionInventario extends StatelessWidget {
  const ExcelTabGestionInventario({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GestionInventarioController>(
      builder: (estionInventarioController) {
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
                              columns: estionInventarioController
                                  .getColumnsTableGestionInventario(),
                              rows: estionInventarioController
                                  .getRowsTableGestionInventario()),
                        ),
                      ),
                    ],
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
                    
