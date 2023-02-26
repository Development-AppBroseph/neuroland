import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/models/category.dart';
import 'package:grow_food/features/categories/category/category.dart';
import 'package:grow_food/features/categories/widgets/course.dart';
import 'package:scale_button/scale_button.dart';

class CategoriesView extends StatelessWidget {
  CategoriesView({super.key});

  final List<CategoryModel> _categories = [
    CategoryModel(
      title: 'Английский для детей',
      imageAssets: 'assets/images/girl.png',
      hashtags: '#люблю   #учиться',
    ),
    CategoryModel(
      title: 'Дошкольная подготовка',
      imageAssets: 'assets/images/boy.png',
      hashtags: '#дошкольнаяподготовка   ',
    ),
    CategoryModel(
      title: 'Курс "Супермозг"',
      imageAssets: 'assets/images/mans.png',
      hashtags: '#супермозг  ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        shadowColor: Colors.black12,
        title: Text(
          'Все курсы',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CourseView(categoryModel: _categories[index]);
        },
        itemCount: _categories.length,
      ),
    );
  }
}
