import 'package:card_loading/card_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/constants/svg_and_img.dart';
import 'package:grow_food/core/helpers/custom_input_formaters/custom_input_formatter_number.dart';
import 'package:grow_food/core/helpers/widgets/custom_text.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_in/controller/sign_in_cubit.dart';
import 'package:grow_food/features/presentation/profile/presentation/controller/profile_cubit.dart';
import 'package:grow_food/features/presentation/profile/presentation/controller/profile_state.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String name = '';
  String phone = '';
  String email = '';
  @override
  void initState() {
    nameController.addListener(() {});
    phoneController.addListener(() {});
    emailController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoadedState) {
          nameController.text = state.profile.name;
          phoneController.text = state.profile.phone;
          emailController.text = state.profile.email;
          phoneController.text =
              '${state.profile.phone.substring(0, 2)} (${state.profile.phone.substring(2, 5)}) ${state.profile.phone.substring(5, 8)}-${state.profile.phone.substring(8, 10)}-${state.profile.phone.substring(10, 12)}';
        }
      },
      builder: (context, state) {
        if (state is ProfileInitialState) {
          context.read<ProfileCubit>().fetchProfile();
        }
        if (state is ProfileLoadedState) {
          nameController.text = state.profile.name;
          phoneController.text = state.profile.phone;
          emailController.text = state.profile.email;
          phoneController.text =
              '${state.profile.phone.substring(0, 2)} (${state.profile.phone.substring(2, 5)}) ${state.profile.phone.substring(5, 8)}-${state.profile.phone.substring(8, 10)}-${state.profile.phone.substring(10, 12)}';
        }
        return Scaffold(
          backgroundColor: ColorsStyles.backgroundColor,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  // height: 540,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorsStyles.whiteColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.r),
                      bottomLeft: Radius.circular(20.r),
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      children: [
                        if (state is ProfileLoadedState)
                          Container(
                            margin: EdgeInsets.only(top: 60.h, left: 24.w),
                            child: Row(
                              children: [
                                CustomText(
                                  title: 'Привет, ${state.profile.name}!',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                ),
                              ],
                            ),
                          )
                        else
                          Row(
                            children: [
                              CardLoading(
                                height: 24,
                                width: 185,
                                margin: EdgeInsets.only(top: 60.w, left: 24),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ],
                          ),
                        if (state is ProfileLoadedState)
                          Container(
                            height: 150,
                            width: 150,
                            margin: EdgeInsets.only(top: 53.h, bottom: 20.h),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xffD9D9D9),
                              borderRadius: BorderRadius.circular(40.r),
                            ),
                            child: const Icon(
                              Icons.camera_alt_rounded,
                              color: Color(0xff969696),
                              size: 50,
                            ),
                          )
                        else
                          CardLoading(
                            height: 150,
                            width: 150,
                            margin: EdgeInsets.only(top: 53.h, bottom: 20.h),
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                        Column(
                          children: [
                            if (state is ProfileLoadedState)
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 24.w),
                                child: TextField(
                                  cursorColor: ColorsStyles.blackColor,
                                  controller: nameController,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: ColorsStyles.blackColor,
                                  ),
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff6B6B6B),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff6B6B6B),
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsets.only(top: 10, bottom: 8),
                                    labelText: 'Имя',
                                    labelStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff6B6B6B)),
                                    floatingLabelStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff6B6B6B),
                                    ),
                                  ),
                                ),
                              )
                            else
                              CardLoading(
                                height: 60,
                                margin: EdgeInsets.symmetric(horizontal: 24.w),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (state is ProfileLoadedState)
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 24.w),
                                child: TextField(
                                  cursorColor: ColorsStyles.blackColor,
                                  inputFormatters: [maskFormatter],
                                  controller: phoneController,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: ColorsStyles.blackColor,
                                  ),
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff6B6B6B),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff6B6B6B),
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsets.only(top: 10, bottom: 8),
                                    labelText: 'Номер',
                                    labelStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff6B6B6B)),
                                    floatingLabelStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff6B6B6B),
                                    ),
                                  ),
                                ),
                              )
                            else
                              CardLoading(
                                height: 60,
                                margin: EdgeInsets.symmetric(horizontal: 24.w),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (state is ProfileLoadedState)
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 24.w),
                                child: TextField(
                                  cursorColor: ColorsStyles.blackColor,
                                  controller: emailController,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: ColorsStyles.blackColor,
                                  ),
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff6B6B6B),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff6B6B6B),
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsets.only(top: 10, bottom: 8),
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff6B6B6B)),
                                    floatingLabelStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff6B6B6B),
                                    ),
                                  ),
                                ),
                              )
                            else
                              CardLoading(
                                height: 60,
                                margin: EdgeInsets.symmetric(horizontal: 24.w),
                                borderRadius: BorderRadius.circular(20.r),
                              )
                          ],
                        ),
                        const SizedBox(
                          height: 33,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 60.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 19.h,
                  ),
                  decoration: BoxDecoration(
                    color: ColorsStyles.whiteColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    children: [
                      CustomText(
                        title: 'Персональные уведомления',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      const Spacer(),
                      CupertinoSwitch(
                        onChanged: (bool value) {
                          setState(() {
                            toggle = value;
                          });
                        },
                        value: toggle,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 60.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 19.h,
                  ),
                  decoration: BoxDecoration(
                    color: ColorsStyles.whiteColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    children: [
                      CustomText(
                        title: 'Реферальная ссылка',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        SvgImg.refLink,
                        color: ColorsStyles.buttonColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                GestureDetector(
                  onTap: () => context.read<SignInCubit>().logOut(),
                  child: Container(
                    height: 60.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 19.h,
                    ),
                    decoration: BoxDecoration(
                      color: ColorsStyles.whiteColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      children: [
                        CustomText(
                          title: 'Выйти из аккаунта',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorsStyles.exitColor,
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          SvgImg.exit,
                          color: ColorsStyles.exitColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
