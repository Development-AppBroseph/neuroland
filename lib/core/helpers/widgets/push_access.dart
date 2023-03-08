import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';

class PushAccess extends StatelessWidget {
  final String title;
  final String subTitle;
  const PushAccess({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 90.h),
      decoration: BoxDecoration(
        color: ColorsStyles.buttonColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xffFFFFFF)),
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffFFFFFF)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
