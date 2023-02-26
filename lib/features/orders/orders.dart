import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/features/widgets/buttons.dart';
import 'package:scale_button/scale_button.dart';

class OrdersView extends StatelessWidget {
  final Function() onTap;
  const OrdersView({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(flex: 3, child: Container()),
          Center(
            child: Image.asset(
              'assets/images/like.png',
              width: 250.w,
            ),
          ),
          Expanded(flex: 2, child: Container()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 80.w),
            child: Text(
              'У вас пока нет доступных онлайн-курсов',
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w700,
                fontSize: 25.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              'Пробное занятие бесплатно!',
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w400,
                fontSize: 22.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(child: Container()),
          // AccentButton(onTap: onTap, title: 'Записаться на занятие'),
          ScaleButton(
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
                  'Записаться на занятие',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 19.sp,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 10,
      //   shadowColor: Colors.black12,
      //   title: Text(
      //     'Заказы',
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontWeight: FontWeight.w600,
      //       fontSize: 18.sp,
      //     ),
      //   ),
      // ),
    );
  }
}
