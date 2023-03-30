import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/constants/svg_and_img.dart';
import 'package:grow_food/core/helpers/functions/functions.dart';
import 'package:grow_food/core/helpers/widgets/custom_button.dart';
import 'package:grow_food/core/helpers/widgets/my_behavior.dart';
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
    Function() onSuccess,
  ) async {
    if (emailOrPhoneNumber.isEmpty || password.isEmpty) {
      SmartDilogFunctions.showErrorDilog(title: 'Есть не заполненные поля');
    } else {
      onSuccess();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return BlocBuilder<SignInCubit, SignInStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorsStyles.backgroundColor,
          body: SafeArea(
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    height: 106.h,
                    width: 320.w,
                    margin: EdgeInsets.only(
                      top: 170.h,
                      right: 24.w,
                      left: 24.w,
                      bottom: 206.h,
                    ),
                    child: Image.asset(
                      Img.logo,
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
                    onTap: () => context.read<SignInCubit>().signIn(
                          emailOrPhoneNumber: controllerNumberOrEmail.text,
                          password: controllerPassword.text,
                          onSuccess: () {
                            if (mounted) {
                              return Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/HomeView',
                                (route) => false,
                              );
                            }
                          },
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
          ),
        );
      },
    );
  }
}
