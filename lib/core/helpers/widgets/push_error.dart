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
          // color: const Color(0xffBE272E),
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [...ColorsStyles.gradientBlueColor],
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                title: title,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: ColorsStyles.whiteColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
