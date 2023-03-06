import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/widgets/custom_text.dart';
import 'package:grow_food/core/helpers/widgets/custom_text_field.dart';

class EntryWidget extends StatefulWidget {
  final TextEditingController controllerNumberOrEmail;
  final TextEditingController controllerPassword;
  const EntryWidget({
    super.key,
    required this.controllerNumberOrEmail,
    required this.controllerPassword,
  });

  @override
  State<EntryWidget> createState() => _EntryWidgetState();
}

class _EntryWidgetState extends State<EntryWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            title: 'Вход в аккаунт',
            fontWeight: FontWeight.bold,
            fontSize: 32.sp,
            color: ColorsStyles.mainTextColor,
          ),
          SizedBox(
            height: 30.h,
          ),
          CustomTextField(
            color: ColorsStyles.backgroundTextField,
            hintText: 'Email или телефон',
            controller: widget.controllerNumberOrEmail,
            type: TextInputType.number,
            password: false,
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextField(
            color: ColorsStyles.backgroundTextField,
            hintText: 'Пароль',
            controller: widget.controllerPassword,
            password: true,
          ),
        ],
      ),
    );
  }
}
