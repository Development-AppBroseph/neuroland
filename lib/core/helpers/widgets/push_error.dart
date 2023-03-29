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
      height: 63.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              ...ColorsStyles.gradientBlueColor,
            ],
          )),
      child: CustomText(
        centerTitle: true,
        title: title,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: ColorsStyles.whiteColor,
      ),
    );
  }
}
