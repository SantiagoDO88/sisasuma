import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/pages/rutero/pages/detalles_rutero/detalles_rutero_controller.dart';

class ExpandablePanel extends StatelessWidget {
  final Widget header;
  final Widget body;
  final bool isCartera;
  ExpandablePanel(
      {super.key,
      required this.header,
      required this.body,
      this.isCartera = false});

  final RxBool isOpen = false.obs;

  @override
  Widget build(BuildContext context) {
    isCartera ? isOpen.value = true : isOpen.value = false;
    return GetX<DetallesRuteroController>(
      builder: (detallesRuteroController) {
        return ExpansionPanelList(
          elevation: 0,
          expansionCallback: (int index, bool isExpanded) {
            isOpen.value = !isOpen.value;
          },
          children: [
            ExpansionPanel(
              canTapOnHeader: true,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                    Get.width * 0.080,
                    Get.height * 0.02,
                    Get.width * 0,
                    Get.height * 0.02,
                  ),
                  child: header,
                );
              },
              body: Padding(
                padding: EdgeInsets.fromLTRB(
                  Get.width * 0.040,
                  0,
                  Get.width * 0.040,
                  Get.height * 0.02,
                ),
                child: body,
              ),
              isExpanded: isOpen.value,
            ),
          ],
        );
      },
    );
  }
}
