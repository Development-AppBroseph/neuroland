import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/constants/svg_and_img.dart';
import 'package:grow_food/core/helpers/widgets/custom_button.dart';

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
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsStyles.backgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 380.h,
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: 60.h, right: 24.w, left: 24.w, bottom: 42.h),
              child: Image.asset(
                Img.signInBackground,
                fit: BoxFit.contain,
              ),
            ),
            EntryWidget(
              controllerNumberOrEmail: controllerNumberOrEmail,
              controllerPassword: controllerPassword,
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomButton(
              title: 'Войти',
              accentText: true,
              onTap: () => Navigator.pushNamed(context, '/HomeView'),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomButton(
              title: 'Регистрация',
              outLined: true,
              accentText: true,
              onTap: () => Navigator.pushNamed(context, '/SignUp'),
            ),
          ],
        ),
      ),
    );
  }
}
