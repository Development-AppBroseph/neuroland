import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scale_button/scale_button.dart';

import '../../constants/colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final bool accentText;
  final bool withPadding;
  final bool outLined;
  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
    required this.accentText,
    this.withPadding = true,
    this.outLined = false,
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
          border: outLined
              ? Border.all(
                  color: ColorsStyles.mainTextColor,
                  width: 2.w,
                )
              : Border.all(
                  color: ColorsStyles.buttonColor,
                ),
          borderRadius: BorderRadius.circular(10.r),
          color: outLined ? ColorsStyles.whiteColor : ColorsStyles.buttonColor,
        ),
        child: CustomText(
          title: title,
          fontSize: 18.sp,
          fontWeight: accentText ? FontWeight.w700 : null,
          color:
              outLined ? ColorsStyles.mainTextColor : ColorsStyles.whiteColor,
        ),
      ),
    );
  }
}
