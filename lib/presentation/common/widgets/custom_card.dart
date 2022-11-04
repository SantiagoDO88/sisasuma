import 'package:flutter/material.dart';
import 'package:uma/presentation/common/style/style.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    Key? key,
    this.body,
    this.color = kPrimaryWhite,
    this.borderRadius = 20,
  }) : super(key: key);
  final Widget? body;
  Color color = Colors.white;
  double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      color: color,
      // elevation: WidgetStyles.cardElevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(0),
        child: body,
      ),
    );
  }
}