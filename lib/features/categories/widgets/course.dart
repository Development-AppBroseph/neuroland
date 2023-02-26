import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/models/category.dart';
import 'package:grow_food/features/categories/category/category.dart';
import 'package:scale_button/scale_button.dart';

class CourseView extends StatelessWidget {
  final CategoryModel categoryModel;
  const CourseView({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      bound: 0.02,
      duration: const Duration(milliseconds: 100),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CategoryPage(),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 10.h),
        child: Column(
          children: [
            SizedBox(height: 25.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    categoryModel.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp,
                    ),
                  ),
                  Container(
                    height: 35.h,
                    width: 35.h,
                    decoration: const BoxDecoration(
                      color: redColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 17.h,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.w),
              height: 170.h,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: accentColor.withOpacity(1),
                borderRadius: BorderRadius.circular(15.r),
              ),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Center(
                    child: Image.asset('assets/images/blue_background.png'),
                  ),
                  Center(
                    child: Image.asset(categoryModel.imageAssets),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  categoryModel.hashtags.toUpperCase(),
                  style: TextStyle(
                    color: const Color.fromARGB(255, 87, 87, 87),
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
    ;
  }
}
