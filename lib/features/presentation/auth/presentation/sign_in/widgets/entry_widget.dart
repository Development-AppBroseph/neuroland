import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/custom_input_formaters/custom_input_formatter_number.dart';
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
  List<TextInputFormatter> formater = [];

  List<TextInputFormatter> getFormaters() {
    try {
      if (widget.controllerNumberOrEmail.text[0] == '7' ||
          widget.controllerNumberOrEmail.text[0] == '8' ||
          widget.controllerNumberOrEmail.text[0] == '+' ||
          widget.controllerNumberOrEmail.text[0] == '9') {
        return [maskFormatter];
      }
      return [];
    } catch (_) {
      return [];
    }
  }

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
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 18.5.h),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: ColorsStyles.backgroundTextField,
            ),
            child: TextField(
              controller: widget.controllerNumberOrEmail,
              style: TextStyle(
                fontSize: 20.sp,
                color: ColorsStyles.blackColor,
                fontWeight: FontWeight.w400,
                fontFamily: 'Mons'
              ),
              textAlignVertical: TextAlignVertical.center,
              cursorColor: ColorsStyles.blackColor,
              textCapitalization: TextCapitalization.none,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration.collapsed(
                hintText: 'Email или телефон',
                hintStyle: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: 'Mons',
                  fontWeight: FontWeight.w500,
                  color: ColorsStyles.textFiledHintColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextField(
            color: ColorsStyles.backgroundTextField,
            hintText: 'Пароль',
            controller: widget.controllerPassword,
            isText: false,
            isPassword: true,
          ),
        ],
      ),
    );
  }
}
