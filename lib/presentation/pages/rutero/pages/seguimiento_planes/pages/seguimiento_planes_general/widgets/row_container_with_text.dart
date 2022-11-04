import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/style.dart';

class RowContainerWithText extends StatelessWidget {
  final String campoParaAsignar;
  final String text;

  const RowContainerWithText({
    Key? key,
    required this.campoParaAsignar,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            campoParaAsignar,
            style: TextStyles.bodyStyle(isBold: true, color: kGrayTitle),
          ),
        ),
        SizedBox(
          width: Get.width * 0.04,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 14,
              ),
              child: Text(
                text,
                style: TextStyles.bodyStyle(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
