import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/constants/svg_and_img.dart';
import 'package:grow_food/core/helpers/custom_input_formaters/custom_input_formatter_number.dart';
import 'package:grow_food/core/helpers/firebase.dart';
import 'package:grow_food/core/helpers/functions/functions.dart';
import 'package:grow_food/core/helpers/widgets/custom_text.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_in/controller/sign_in_cubit.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/presentation/coupons/controller/partner_coupons_cubit.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/coupon_entiti.dart';
import 'package:grow_food/features/presentation/profile/presentation/controller/profile_cubit.dart';
import 'package:grow_food/features/presentation/profile/presentation/controller/profile_state.dart';
import 'package:grow_food/features/presentation/profile/presentation/widgets/bought_coupons_page.dart';
import 'package:grow_food/features/presentation/profile/presentation/widgets/profile_textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

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
  File? _image;
  List<CouponEntiti> coupons = [];

  Future pickImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;
      File? img = File(image.path);
      Uint8List imageBytes = await img.readAsBytes();
      String base64String = base64Encode(imageBytes);
      setState(() {
        _image = img;
        context
            .read<ProfileCubit>()
            .editUserAvatar('data:image/png;base64,$base64String');
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    nameController.addListener(() {});
    phoneController.addListener(() {});
    emailController.addListener(() {});
       context.read<ProfileCubit>().fetchProfile();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) {
        return true;
      },
      builder: (context, state) {
         log('${state}');
        if (state is ProfileInitialState) {
          context.read<ProfileCubit>().fetchProfile();
        }
        if (state is ProfileLoadedState) {
          
          log('${state.profile.coupons}');
          nameController.text = state.profile.user.name;
          phoneController.text = state.profile.user.phone;
          emailController.text = state.profile.user.email;
          phoneController.text =
              maskFormatter.maskText(state.profile.user.phone);
              coupons = state.profile.coupons;
        }
        return Scaffold(
          backgroundColor: ColorsStyles.backgroundColor,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
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
                                  title: 'Привет, ${state.profile.user.name}!',
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
                          GestureDetector(
                            onTap: () => {
                              pickImage(ImageSource.gallery),
                            },
                            child: Container(
                              height: 150,
                              width: 150,
                              margin: EdgeInsets.only(top: 53.h, bottom: 20.h),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xffD9D9D9),
                                borderRadius: BorderRadius.circular(40.r),
                                // image: DecorationImage(
                                //   image: FileImage(_image!),
                                //   fit: BoxFit.cover,
                                // ),
                              ),
                              child: state.profile.user.avatar == null
                                  ? const Icon(
                                      Icons.camera_alt_rounded,
                                      color: Color(0xff969696),
                                      size: 50,
                                    )
                                  : _image != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40.r),
                                          child: Image.file(
                                            _image!,
                                            fit: BoxFit.cover,
                                            height: 150,
                                            width: 150,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40.r),
                                          child: Image.network(
                                            state.profile.user.avatar!,
                                            fit: BoxFit.cover,
                                            height: 150,
                                            width: 150,
                                          ),
                                        ),
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
                              ProfileTextField(
                                textCapitalization: TextCapitalization.words,
                                textInputType: TextInputType.name,
                                isNumber: false,
                                controller: nameController,
                                onFinished: () => context
                                    .read<ProfileCubit>()
                                    .editUserName(nameController.text),
                                title: 'Имя',
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
                              ProfileTextField(
                                textCapitalization: TextCapitalization.none,
                                textInputType: TextInputType.number,
                                isNumber: true,
                                controller: phoneController,
                                onFinished: () => context
                                    .read<ProfileCubit>()
                                    .editUserNumber(
                                        '+7${maskFormatter.getUnmaskedText()}'),
                                title: 'Номер',
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
                              ProfileTextField(
                                textCapitalization: TextCapitalization.none,
                                textInputType: TextInputType.emailAddress,
                                isNumber: false,
                                controller: emailController,
                                onFinished: () => context
                                    .read<ProfileCubit>()
                                    .editUserEmail(emailController.text),
                                title: 'Email',
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
                // SizedBox(
                //   height: 10.h,
                // ),
                // Container(
                //   height: 60.h,
                //   width: double.infinity,
                //   padding: EdgeInsets.symmetric(
                //     horizontal: 24.w,
                //     vertical: 19.h,
                //   ),
                //   decoration: BoxDecoration(
                //     color: ColorsStyles.whiteColor,
                //     borderRadius: BorderRadius.circular(20.r),
                //   ),
                //   child: Row(
                //     children: [
                //       CustomText(
                //         title: 'Персональные уведомления',
                //         fontSize: 20.sp,
                //         fontWeight: FontWeight.w600,
                //       ),
                //       const Spacer(),
                //       CupertinoSwitch(
                //         onChanged: (bool value) {
                //           setState(() {
                //             toggle = value;
                //           });
                //         },
                //         value: toggle,
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () async {
                    if (state is ProfileLoadedState) {
                      HapticFeedback.lightImpact();
                      print(state.link.inviteLink.substring(59, 69));
                      final url = Uri.parse(state.link.inviteLink);
                      url.queryParameters['referral_link'];
                      // Uri.base.queryParameters(state.link.inviteLink);
                      final refLink = await FirebaseSevice.copyLink(
                          url.queryParameters['referral_code']!);
                      await Clipboard.setData(ClipboardData(
                        text: refLink,
                      )).then((_) {
                        SmartDialogFunctions.showInfoDilog(
                          title: 'Ссылка скопирована',
                        );
                      });
                    }
                  },
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
                ),
                SizedBox(
                  height: 10.h,
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
                          title: 'Политика конфиденциальности',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        const Spacer(),
                        // SvgPicture.asset(
                        //   SvgImg.cupones,
                        //   color: ColorsStyles.buttonColor,
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  BoughtCouponsPage(coupons: coupons),
                      ),
                    );
                  },
                  child: Container(
                    height: 65.h,
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
                          title: 'Купленные купоны',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                GestureDetector(
                  onTap: () => context.read<SignInCubit>().logOut(
                        () => {
                          if (mounted)
                            {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/',
                                (route) => false,
                              ),
                            }
                        },
                      ),
                  child: Container(
                    height: 65.h,
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
                SizedBox(
                  height: 40.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
