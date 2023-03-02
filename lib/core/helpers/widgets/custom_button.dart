import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scale_button/scale_button.dart';

import '../../constants/colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final List<Color> listOfColors;
  final bool accentText;
  final bool withPadding;
  const CustomButton({
    super.key,
    required this.title,
    required this.listOfColors,
    this.onTap,
    required this.accentText,
    this.withPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      onTap: onTap,
      bound: 0.02,
      duration: const Duration(milliseconds: 100),
      child: Container(
        height: 55.h,
        margin: EdgeInsets.symmetric(horizontal: withPadding ? 35.w : 0.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              ...listOfColors,
            ],
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: CustomText(
          title: title,
          fontSize: 18.sp,
          fontWeight: accentText ? FontWeight.w700 : null,
          color: ColorsStyles.whiteColor,
        ),
      ),
    );
  }
}
