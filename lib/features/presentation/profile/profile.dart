import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/features/widgets/buttons.dart';
import 'package:scale_button/scale_button.dart';

import '../categories/category/category.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            _topInfo(context),
            AccentButton(onTap: () {}, title: '123123')
          ],
        ),
      ),
    );
  }

  Container _thirdInfo(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: Colors.grey[300]!,
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        children: [
          _listTileWidget(context, 'Настройки меню', 'assets/icons/user.svg'),
          Container(
            height: 0.5.h,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.3),
          ),
          _listTileWidget(context, 'Мои параметры', 'assets/icons/user.svg'),
          Container(
            height: 0.5.h,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.3),
          ),
          _listTileWidget(
              context, 'Настройки доставок', 'assets/icons/user.svg'),
          Container(
            height: 0.5.h,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.3),
          ),
          _listTileWidget(
              context, 'Избранное и стоп-лист', 'assets/icons/user.svg'),
          Container(
            height: 0.5.h,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.3),
          ),
          _listTileWidget(context, 'Адреса', 'assets/icons/user.svg'),
        ],
      ),
    );
  }

  Container _secondInfo(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: Colors.grey[300]!,
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        children: [
          _listTileWidget(context, 'Кошелек', 'assets/icons/user.svg'),
          Container(
            height: 0.5.h,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.3),
          ),
          _listTileWidget(
              context, 'Ввести сертификат', 'assets/icons/user.svg'),
        ],
      ),
    );
  }

  Container _topInfo(BuildContext context) {
    return Container(
      width: double.infinity,
      // margin: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(15.r),
        // boxShadow: [
        //   BoxShadow(
        //     offset: Offset(0, 0),
        //     color: Colors.grey[300]!,
        //     blurRadius: 10,
        //   )
        // ],
      ),
      child: Column(
        children: [
          _listTileWidget(context, 'Денис', 'assets/icons/user.svg',
              subtitle: '@deniskrytsin'),
          // Container(
          //   height: 0.5.h,
          //   width: double.infinity,
          //   color: Colors.grey.withOpacity(0.3),
          // ),
          _listTileWidget(context, 'Баланс', 'assets/icons/user.svg'),
          // Container(
          //   height: 0.5.h,
          //   width: double.infinity,
          //   color: Colors.grey.withOpacity(0.3),
          // ),
          _listTileWidget(
              context, 'Программа лояльности', 'assets/icons/user.svg'),
          // Container(
          //   height: 0.5.h,
          //   width: double.infinity,
          //   color: Colors.grey.withOpacity(0.3),
          // ),
          _listTileWidget(
              context, 'Уведомления', 'assets/icons/notification.svg'),
        ],
      ),
    );
  }

  ScaleButton _listTileWidget(BuildContext context, String label, String asset,
      {String? subtitle}) {
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
      child: SizedBox(
        height: 70.h,
        child: Center(
          child: ListTile(
            leading: Container(
              height: 30.h,
              width: 30.h,
              margin: subtitle != null ? EdgeInsets.only(top: 3.h) : null,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.all(4.h),
              child: SvgPicture.asset(
                asset,
                color: Colors.white,
                width: 10.w,
                height: 10.h,
              ),
            ),
            title: Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 17.sp,
              ),
            ),
            subtitle: subtitle != null
                ? Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  )
                : null,
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 10,
      shadowColor: Colors.black12,
      title: Text(
        'Профиль',
        style: TextStyle(
          color: accentColor,
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}
