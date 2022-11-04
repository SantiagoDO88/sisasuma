import 'package:uma/presentation/common/style/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String placeHolder;
  final dynamic Function()? onPressed;
  final Color backgroundColor;
  final Color textColor;

  const CustomButton({
    super.key,
    required this.placeHolder,
    required this.onPressed,
    this.backgroundColor = kPrimaryRed,
    this.textColor = kPrimaryWhite,

  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          elevation: 4,
          disabledBackgroundColor: kPrimaryGrey,
          backgroundColor: backgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          minimumSize: const Size(0, 50)),
      child: Text(
        placeHolder,
        style: TextStyles.buttonStyle(isBold: true,color: textColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
