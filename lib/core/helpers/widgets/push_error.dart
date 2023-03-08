import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/widgets/custom_text.dart';

class PushError extends StatelessWidget {
  final String title;
  const PushError({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xffF01111),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: 'Ошибка',
                  color: ColorsStyles.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
                SizedBox(
                  width: 343,
                  child: CustomText(
                    title: title,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsStyles.whiteColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
