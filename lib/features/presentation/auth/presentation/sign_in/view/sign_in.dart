import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/constants/svg_and_img.dart';
import 'package:grow_food/core/helpers/functions/functions.dart';
import 'package:grow_food/core/helpers/widgets/custom_button.dart';
import 'package:grow_food/core/helpers/widgets/custom_text.dart';
import 'package:grow_food/core/helpers/widgets/my_behavior.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_in/controller/sign_in_cubit.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_in/controller/sign_in_state.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/presentation/learning/controller/actual_courses_cubit.dart';
import 'package:grow_food/features/presentation/profile/presentation/controller/profile_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

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
      SmartDialogFunctions.showErrorDilog(title: 'Есть не заполненные поля');
    } else {
      onSuccess();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (context, state) {
        if (state == SignInStates.signInLoadedState) {
          context.read<ActualCoursesCubit>().fetchCoursesVideo();
          context.read<ProfileCubit>().fetchProfile();
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorsStyles.whiteColor,
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
                      bottom: 156.h,
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
                  SizedBox(height: 15.h),
                  GestureDetector(
                    onTap: () async {
                       if (!await launchUrl(
                        Uri.parse('http://158.160.44.207:9001/project_info/03_Положение_по_защите_и_обработке_персональных_данных_2.pdf'),
                        mode: LaunchMode.externalNonBrowserApplication,
                      )) {
                        throw 'Could not launch';
                      }
                    },
                    child: Center(
                      child: CustomText(
                        title: 'Политика конфиденциальности',
                        fontSize: 16.h,
                      ),
                    ),
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
