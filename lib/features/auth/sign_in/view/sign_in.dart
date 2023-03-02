import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/constants/svg_and_img.dart';
import 'package:grow_food/core/helpers/widgets/custom_button.dart';
import 'dart:math' as math;

import '../widgets/entry_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController controllerNumberOrEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorsStyles.backgroundColor,
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
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 134.h, bottom: 121.h),
                child: Image.asset(
                  Img.logo,
                  height: 73.h,
                  width: 220.w,
                ),
              ),
              EntryWidget(
                controllerNumberOrEmail: controllerNumberOrEmail,
                controllerPassword: controllerPassword,
              ),
              const Spacer(),
              CustomButton(
                title: 'Войти',
                listOfColors: ColorsStyles.gradientRedColor,
                accentText: true,
                onTap: () => Navigator.pushNamed(context, '/HomeView'),
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 65.h),
                child: CustomButton(
                  title: 'Регистрация',
                  listOfColors: ColorsStyles.gradientBlueColor,
                  accentText: true,
                  onTap: () => Navigator.pushNamed(context, '/SignUp'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
