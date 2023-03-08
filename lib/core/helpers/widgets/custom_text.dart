import 'package:flutter/material.dart';
import 'package:grow_food/core/constants/colors.dart';

class CustomText extends StatelessWidget {
  final String title;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? fontSize;
  final Color color;
  final bool? centerTitle;
  final int? maxLength;
  const CustomText({
    super.key,
    required this.title,
    this.fontWeight = FontWeight.w600,
    this.fontSize,
    this.fontStyle,
    this.maxLength,
    this.centerTitle = false,
    this.color = ColorsStyles.blackColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLength == null
          ? title
          : title.length < maxLength!
              ? title
              : '${title.substring(0, maxLength! - 1)}...',
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
      ),
      textAlign: centerTitle! ? TextAlign.center : TextAlign.left,
    );
  }
}
