import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/functions/functions.dart';
import 'package:grow_food/core/helpers/widgets/custom_button.dart';
import 'package:grow_food/core/helpers/widgets/custom_text.dart';
import 'package:grow_food/core/helpers/widgets/custom_text_field.dart';
import 'package:grow_food/core/helpers/widgets/my_behavior.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_up/controller/sign_up_cubit.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_up/controller/sign_up_state.dart';

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
  void initState() {
    super.initState();
    controllerName.addListener(() {});
    controllerNumber.addListener(() {});
    controllerEmail.addListener(() {});
    controllerPassword.addListener(() {});
    compareControllerPassword.addListener(() {});
  }

  Future<void> onSuccessRegistration(
    String name,
    String number,
    String email,
    String password,
    String comparePassword,
    Future<void> Function() onSuccess,
  ) async {
    if (name.isEmpty ||
        number.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        comparePassword.isEmpty) {
      SmartDilogFunctions.showErrorDilog(title: 'Есть не заполненные поля');
    } else if (controllerPassword.text != compareControllerPassword.text) {
      SmartDilogFunctions.showErrorDilog(title: 'Пароли не совпадают');
    } else if (!controllerEmail.text.contains('@')) {
      SmartDilogFunctions.showErrorDilog(title: 'Ввели не правильный Email');
    } else {
      await onSuccess();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
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
            child: ScrollConfiguration(
              behavior: MyBehavior(),
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
                          type: TextInputType.name,
                          isText: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: CustomTextField(
                          color: ColorsStyles.backgroundTextField,
                          controller: controllerNumber,
                          hintText: 'Телефон',
                          type: TextInputType.number,
                          isText: false,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: CustomTextField(
                          color: ColorsStyles.backgroundTextField,
                          controller: controllerEmail,
                          hintText: 'Почта',
                          type: TextInputType.emailAddress,
                          isText: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: CustomTextField(
                          color: ColorsStyles.backgroundTextField,
                          controller: controllerPassword,
                          hintText: 'Пароль',
                          isEmailOrPassword: true,
                          type: TextInputType.text,
                          isText: false,
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
                    isText: false,
                    isEmailOrPassword: true,
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: CustomButton(
                      title: 'Зарегистрироваться',
                      accentText: true,
                      onTap: () => onSuccessRegistration(
                        controllerName.text,
                        controllerNumber.text,
                        controllerEmail.text,
                        controllerPassword.text,
                        compareControllerPassword.text,
                        () => context.read<SignUpCubit>().signUp(
                              userName: controllerName.text,
                              phoneNumber: controllerNumber.text,
                              email: controllerEmail.text,
                              password: controllerPassword.text,
                              onSuccess: () =>
                                  Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/HomeView',
                                (route) => false,
                              ),
                            ),
                      ),
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
          ),
        );
      },
    );
  }
}
