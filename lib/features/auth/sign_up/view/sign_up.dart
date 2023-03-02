import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/widgets/custom_text.dart';
import 'package:grow_food/core/helpers/widgets/custom_text_field.dart';
import 'dart:math' as math;

import '../../../../core/constants/svg_and_img.dart';
import '../../../../core/helpers/widgets/custom_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerNumber = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: ColorsStyles.blackColor,
          ),
        ),
        backgroundColor: ColorsStyles.backgroundColor,
        title: CustomText(
          title: 'Регистрация',
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 55.h),
              child: Transform.rotate(
                angle: math.pi / 25,
                child: Image.asset(
                  Img.bottomImage,
                  width: 235.w,
                  height: 180.h,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 35.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50.h, bottom: 84.h),
                  child: Image.asset(
                    Img.logo,
                    height: 73.h,
                    width: 220.w,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.5),
                      child: CustomTextField(
                        color: ColorsStyles.whiteColor,
                        controller: controllerName,
                        hintText: 'Имя*',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.5),
                      child: CustomTextField(
                        color: ColorsStyles.whiteColor,
                        controller: controllerNumber,
                        hintText: 'Телефон*',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.5),
                      child: CustomTextField(
                        color: ColorsStyles.whiteColor,
                        controller: controllerEmail,
                        hintText: 'Почта*',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.5),
                      child: CustomTextField(
                        color: ColorsStyles.whiteColor,
                        controller: controllerPassword,
                        hintText: 'Пароль*',
                        password: true,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: CustomText(
                    title: 'Политика конфиденциальности',
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 65.h),
                  child: CustomButton(
                    title: 'Зарегистрироваться',
                    listOfColors: ColorsStyles.gradientBlueColor,
                    accentText: true,
                    onTap: () => null,
                    withPadding: false,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
