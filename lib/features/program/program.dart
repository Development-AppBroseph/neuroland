import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/models/category.dart';
import 'package:grow_food/features/categories/category/category.dart';
import 'package:grow_food/features/categories/widgets/course.dart';
import 'package:scale_button/scale_button.dart';

class ProgramView extends StatelessWidget {
  const ProgramView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _topInfo(context),
            SizedBox(height: 10.h),
            _programView(context),
            SizedBox(height: 10.h),
            CourseView(
              categoryModel: CategoryModel(
                title: 'Английский для детей',
                imageAssets: 'assets/images/girl.png',
                hashtags: '#люблю   #учиться',
              ),
            ),
          ],
        ),
      ),
    );
  }

  ScaleButton _programView(BuildContext context) {
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
        height: 150.h,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Прогрес обучения',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 21.sp,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                  size: 20.h,
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Вы прошли 15 %',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
            ),
            Container(
              height: 25.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: redColor,
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _topInfo(BuildContext context) {
    return Container(
      height: 250.h,
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Понравился курс?',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 21.sp,
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: accentColor,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 40.w,
                vertical: 20.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Дошкольная подготовка',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 21.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ScaleButton(
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
                      height: 45.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'ПРОДОЛЖИТЬ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 10,
      shadowColor: Color.fromRGBO(0, 0, 0, 0.122),
      centerTitle: false,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15.w),
          child: SvgPicture.asset(
            'assets/icons/notification.svg',
            color: accentColor,
            width: 35.w,
            height: 35.h,
          ),
        )
      ],
      title: SizedBox(
        width: 150.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Денис',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 22.sp,
              ),
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Text(
                  'Баланс: ',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(width: 5.w),
                Text(
                  '500 Б',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 100, 55, 184),
                    fontWeight: FontWeight.w700,
                    fontSize: 17.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
