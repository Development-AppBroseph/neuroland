import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/constants/svg_and_img.dart';
import 'package:grow_food/core/helpers/functions/functions.dart';
import 'package:grow_food/core/helpers/widgets/custom_button.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_in/controller/sign_in_cubit.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_in/controller/sign_in_state.dart';

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
  void initState() {
    controllerNumberOrEmail.addListener(() {});
    controllerPassword.addListener(() {});
    super.initState();
  }

  Future<void> onSuccessRegistration(
    String emailOrPhoneNumber,
    String password,
    Future<void> Function() onSuccess,
  ) async {
    if (emailOrPhoneNumber.isEmpty || password.isEmpty) {
      SmartDilogFunctions.showErrorDilog(title: 'Есть не заполненные поля');
    } else {
      await onSuccess();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
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
                  onTap: () => onSuccessRegistration(
                    controllerNumberOrEmail.text,
                    controllerPassword.text,
                    () => context.read<SignInCubit>().signIn(
                          emailOrPhoneNumber: controllerNumberOrEmail.text,
                          password: controllerPassword.text,
                          onSuccess: () => Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/HomeView',
                            (route) => false,
                          ),
                        ),
                  ),
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
      },
    );
  }
}
