import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/domain/rutero/general/models/rutero_with_cliente.dart';
import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/common/widgets/custom_card.dart';
import 'package:uma/presentation/pages/rutero/rutero_controller.dart';

class ClientCard extends StatelessWidget {
  final Function() onTap;
  final RuteroWithCliente rutero;

  const ClientCard({
    Key? key,
    required this.onTap,
    required this.rutero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RuteroController>(
      builder: (ruteroController) {
        return CustomCard(
          body: InkWell(
            customBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "${rutero.nombreCliente}",
                          style: TextStyles.titleStyle(
                              color: kGrayTitle, isBold: true),
                        ),
                        Text(
                          "C.C: ${rutero.documento}",
                          style: TextStyles.bodyStyle(color: kGraySubtitle),
                        ),
                        Text(
                          "${rutero.direccion}",
                          style: TextStyles.bodyStyle(color: kGraySubtitle),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Slider(
                      max: 3,
                      min: 0,
                      value: double.parse("${0}") + 1,
                      onChanged: (value) {},
                      activeColor: (0 == 0)
                          ? Colors.red
                          : ((0 == 2) ? Colors.green : Colors.yellow),
                      inactiveColor: Colors.grey[300],
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
