import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required  this.icon,
    required this .title,
    this.iconSize=30,
    this.textSize=18,
    this.textLetterSpacing = 1,
    this.textWeight = FontWeight.normal,
    this.textColor = Colors.white,
  });
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  final double textLetterSpacing;
  final FontWeight textWeight;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: iconSize,
        ),
        Text(title,
        style: TextStyle(
          color: textColor,
          fontSize: textSize,
          fontWeight: textWeight,
          letterSpacing: textLetterSpacing,
        ),
        ),
      ],
    );
  }
}