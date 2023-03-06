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
  final TextEditingController compareControllerPassword =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: ColorsStyles.blackColor,
          ),
        ),
        backgroundColor: ColorsStyles.backgroundColor,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 35.w),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 122.h, bottom: 25.h),
                  child: CustomText(
                    title: 'Регистрация',
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsStyles.mainTextColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: CustomTextField(
                    color: ColorsStyles.backgroundTextField,
                    controller: controllerName,
                    hintText: 'Имя',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: CustomTextField(
                    color: ColorsStyles.backgroundTextField,
                    controller: controllerNumber,
                    hintText: 'Телефон',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: CustomTextField(
                    color: ColorsStyles.backgroundTextField,
                    controller: controllerEmail,
                    hintText: 'Почта',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: CustomTextField(
                    color: ColorsStyles.backgroundTextField,
                    controller: controllerPassword,
                    hintText: 'Пароль',
                    password: true,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h, bottom: 20.h),
              child: CustomText(
                title:
                    'Пароль должен состоять из 8 и более символов, содержать заглавные и строчные буквы, цифры',
                fontWeight: FontWeight.w400,
                color: ColorsStyles.textFiledHintColor,
                fontSize: 15.sp,
                centerTitle: true,
              ),
            ),
            CustomTextField(
              hintText: 'Подтвердите пароль',
              color: ColorsStyles.backgroundTextField,
              controller: compareControllerPassword,
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: CustomButton(
                title: 'Зарегистрироваться',
                accentText: true,
                onTap: () => null,
                withPadding: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 86.h),
              child: CustomText(
                title:
                    'Нажимая кнопку, вы автоматически соглашаетесь с Политикой Конфиденциальности',
                fontWeight: FontWeight.w400,
                color: ColorsStyles.textFiledHintColor,
                fontSize: 15.sp,
                centerTitle: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
