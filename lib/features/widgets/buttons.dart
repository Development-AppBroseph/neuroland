import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:scale_button/scale_button.dart';

class AccentButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  const AccentButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      onTap: onTap,
      bound: 0.02,
      duration: const Duration(milliseconds: 100),
      child: Container(
        height: 53.h,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Center(
          child: Text(
            'Выйти из аккаунта',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 19.sp,
            ),
          ),
        ),
      ),
    );
  }
}
