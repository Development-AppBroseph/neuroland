import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        foregroundColor: Colors.black,
        shadowColor: Colors.black12,
        title: Text(
          'Тут скоро появится функционал',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 70.h),
          child: Image.asset(
            'assets/images/like.png',
            width: 250.w,
          ),
        ),
      ),
    );
  }
}
