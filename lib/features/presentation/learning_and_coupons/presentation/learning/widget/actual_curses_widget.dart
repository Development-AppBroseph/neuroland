import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/widgets/custom_text.dart';

class ActualCursesCard extends StatefulWidget {
  final bool isSelected;
  final String title;
  const ActualCursesCard(
      {super.key, required this.isSelected, required this.title});

  @override
  State<ActualCursesCard> createState() => _ActualCursesCardState();
}

class _ActualCursesCardState extends State<ActualCursesCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33.h,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: LinearGradient(
          colors: widget.isSelected
              ? ColorsStyles.gradientBlueColor
              : [ColorsStyles.whiteColor, ColorsStyles.whiteColor],
        ),
        // color: widget.isSelected
        //     ? ColorsStyles.buttonColor
        //     : ColorsStyles.whiteColor,
      ),
      child: CustomText(
        title: widget.title,
        fontSize: 15.sp,
        fontWeight: FontWeight.w900,
        color: widget.isSelected
            ? ColorsStyles.whiteColor
            : ColorsStyles.textFiledHintColor,
      ),
    );
  }
}
