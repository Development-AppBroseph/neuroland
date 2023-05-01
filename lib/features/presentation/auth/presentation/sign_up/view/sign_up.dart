import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/custom_input_formaters/custom_input_formatter_number.dart';
import 'package:grow_food/core/helpers/functions/functions.dart';
import 'package:grow_food/core/helpers/models/towns_model.dart';
import 'package:grow_food/core/helpers/widgets/custom_button.dart';
import 'package:grow_food/core/helpers/widgets/custom_text.dart';
import 'package:grow_food/core/helpers/widgets/custom_text_field.dart';
import 'package:grow_food/core/helpers/widgets/my_behavior.dart';
import 'package:grow_food/features/presentation/auth/data/models/cities_model.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_in/controller/sign_in_cubit.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_up/controller/sign_up_cubit.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_up/controller/sign_up_state.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final TextEditingController controllerTown = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final controller = StreamController<int>();

  bool isSelectCity = false;
  double rotate = 1 / 4;
  double maxScroll = 0.0;
  List<CityModel> towns = [];
  List<CityModel> searchTowm = [];

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }

  @override
  void initState() {
    super.initState();
    getCities();
    controllerName.addListener(() {});
    controllerNumber.addListener(() {});
    controllerEmail.addListener(() {});
    controllerPassword.addListener(() {});
    compareControllerPassword.addListener(() {});
    scrollController.addListener(() {});
    controllerTown.addListener(() {});
  }

  Future<void> onSuccessRegistration(
    String name,
    String number,
    String email,
    String password,
    AsyncSnapshot<int> snapshot,
    Function() onSuccess,
  ) async {
    if (name.isEmpty ||
        number.isEmpty ||
        email.isEmpty ||
        snapshot.data == null ||
        password.isEmpty) {
      SmartDialogFunctions.showErrorDilog(title: 'Есть не заполненные поля');
    } else if (!controllerEmail.text.contains('@')) {
      SmartDialogFunctions.showErrorDilog(title: 'Ввели не правильный Email');
    } else {
      await onSuccess();
    }
  }

  Future<void> getCities() async {
    try {
      final file = await rootBundle.loadString('assets/json/ru_cities.json');
      final response = json.decode(file);
      print(response);
      for (var city in response) {
        towns.add(CityModel.fromJson(city));
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> searchTowms(String text) async {
    searchTowm.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    towns.forEach((city) {
      if (city.district.contains(text) || city.name.contains(text)) {
        searchTowm.add(city);
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return StreamBuilder<int>(
            stream: controller.stream,
            builder: (context, snapshot) {
              return Scaffold(
                backgroundColor: ColorsStyles.whiteColor,
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
                  backgroundColor: ColorsStyles.whiteColor,
                ),
                body: Container(
                  margin: EdgeInsets.symmetric(horizontal: 35.w),
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      cacheExtent: double.infinity,
                      controller: scrollController,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 188.h, bottom: 25.h),
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
                                hintText: 'Мобильный телефон',
                                type: TextInputType.number,
                                isText: false,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              child: CustomTextField(
                                color: ColorsStyles.backgroundTextField,
                                controller: controllerEmail,
                                hintText: 'Email',
                                type: TextInputType.text,
                                isText: true,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              child: CustomTextField(
                                color: ColorsStyles.backgroundTextField,
                                controller: controllerPassword,
                                hintText: 'Пароль',
                                isPassword: true,
                                type: TextInputType.text,
                                isText: false,
                              ),
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            //     setState(() {
                            //       if (!isSelectCity) {
                            //         isSelectCity = true;
                            //         rotate = 1 / 1.35;
                            //         Future.delayed(
                            //                 const Duration(milliseconds: 400))
                            //             .then(
                            //           (value) => scrollController.animateTo(
                            //             scrollController
                            //                 .position.maxScrollExtent,
                            //             duration:
                            //                 const Duration(milliseconds: 200),
                            //             curve: Curves.ease,
                            //           ),
                            //         );
                            //       } else {
                            //         isSelectCity = false;
                            //         rotate = 1 / 4;
                            //       }
                            //     });
                            //   },
                            //   child: Container(
                            //     width: double.infinity,
                            //     padding: EdgeInsets.symmetric(
                            //         horizontal: 30.w, vertical: 18.5.h),
                            //     margin: EdgeInsets.only(top: 5.h),
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(10.r),
                            //       color: ColorsStyles.backgroundTextField,
                            //     ),
                            //     child: Row(
                            //       children: [
                            //         CustomText(
                            //           title: 'Город проживания',
                            //           fontSize: 20.sp,
                            //           fontWeight: FontWeight.w500,
                            //           color: ColorsStyles.textFiledHintColor,
                            //         ),
                            //         const Spacer(),
                            //         AnimatedRotation(
                            //           turns: rotate,
                            //           duration: const Duration(
                            //             milliseconds: 400,
                            //           ),
                            //           curve: Curves.ease,
                            //           child: const Icon(
                            //             Icons.arrow_back_ios_new_rounded,
                            //             color: ColorsStyles.textFiledHintColor,
                            //             size: 20,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              child: CustomTextField(
                                color: ColorsStyles.backgroundTextField,
                                controller: controllerTown,
                                hintText: 'Город',
                                type: TextInputType.text,
                                onTap: () {
                                  setState(() {
                                    if (!isSelectCity) {
                                      isSelectCity = true;
                                      rotate = 1 / 1.35;
                                      Future.delayed(const Duration(
                                              milliseconds: 400))
                                          .then(
                                        (value) => scrollController.animateTo(
                                          scrollController
                                              .position.maxScrollExtent,
                                          duration: const Duration(
                                              milliseconds: 200),
                                          curve: Curves.ease,
                                        ),
                                      );
                                    }
                                  });
                                },
                                onChanged: (text) => searchTowms(text),
                                isText: true,
                              ),
                            ),
                            AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.ease,
                                margin: EdgeInsets.only(top: 10.h),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: ColorsStyles.backgroundTextField,
                                ),
                                child: searchTowm.isNotEmpty ||
                                        controllerTown.text.isNotEmpty
                                    ? ListView.builder(
                                      shrinkWrap: true,
                                        itemCount: searchTowm.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              controller.sink.add(index);
                                            },
                                            child: Container(
                                              height: 60,
                                              alignment: Alignment.centerLeft,
                                              padding: EdgeInsets.only(
                                                left: 30.w,
                                                right: 30.w,
                                                top: 19.h,
                                                bottom: 19.h,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                gradient: LinearGradient(
                                                  colors: snapshot.data == index
                                                      ? ColorsStyles
                                                          .gradientBlueColor
                                                      : [
                                                          Colors.transparent,
                                                          Colors.transparent,
                                                        ],
                                                ),
                                              ),
                                              child: CustomText(
                                                title: searchTowm[index].name,
                                                color: snapshot.data == index
                                                    ? ColorsStyles.whiteColor
                                                    : ColorsStyles
                                                        .textFiledHintColor,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : ListView.builder(
                                        itemCount: towns.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              controller.sink.add(index);
                                            },
                                            child: Container(
                                              height: 60,
                                              alignment: Alignment.centerLeft,
                                              padding: EdgeInsets.only(
                                                left: 30.w,
                                                right: 30.w,
                                                top: 19.h,
                                                bottom: 19.h,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                gradient: LinearGradient(
                                                  colors: snapshot.data == index
                                                      ? ColorsStyles
                                                          .gradientBlueColor
                                                      : [
                                                          Colors.transparent,
                                                          Colors.transparent,
                                                        ],
                                                ),
                                              ),
                                              child: CustomText(
                                                title: towns[index].name,
                                                color: snapshot.data == index
                                                    ? ColorsStyles.whiteColor
                                                    : ColorsStyles
                                                        .textFiledHintColor,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          );
                                        },
                                      )),
                          ],
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
                              snapshot,
                              () => context.read<SignUpCubit>().signUp(
                                    userName: controllerName.text,
                                    phoneNumber:
                                        '+7${maskFormatter.getUnmaskedText()}',
                                    email: controllerEmail.text,
                                    password: controllerPassword.text,
                                    id: 7,
                                    onSuccess: () =>
                                        context.read<SignInCubit>().signIn(
                                              emailOrPhoneNumber:
                                                  controllerEmail.text,
                                              password: controllerPassword.text,
                                              onSuccess: () {
                                                if (mounted) {
                                                  return Navigator
                                                      .pushNamedAndRemoveUntil(
                                                    context,
                                                    '/HomeView',
                                                    (route) => false,
                                                  );
                                                }
                                              },
                                            ),
                                  ),
                            ),
                            withPadding: false,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (!await launchUrl(
                              Uri.parse(
                                  'http://158.160.44.207:9001/project_info/03_Положение_по_защите_и_обработке_персональных_данных_2.pdf'),
                              mode: Platform.isAndroid
                                  ? LaunchMode.externalNonBrowserApplication
                                  : LaunchMode.inAppWebView,
                            )) {
                              throw 'Could not launch';
                            }
                          },
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
            });
      },
    );
  }
}
