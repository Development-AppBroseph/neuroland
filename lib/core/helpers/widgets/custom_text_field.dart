import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';

import '../custom_input_formatter_number.dart';

class CustomTextField extends StatefulWidget {
  final Color color;
  final TextEditingController? controller;
  final TextInputType? type;
  final String hintText;
  final bool isEmailOrPassword;
  final bool isText;
  final bool emailOrNumber;
  const CustomTextField({
    super.key,
    required this.color,
    required this.controller,
    this.type,
    required this.hintText,
    this.isEmailOrPassword = false,
    required this.isText,
    required this.emailOrNumber,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    widget.controller!.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 18.5.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: widget.color,
      ),
      child: TextField(
        controller: widget.controller,
        style: TextStyle(
          fontSize: 20.sp,
          color: ColorsStyles.blackColor,
          fontWeight: FontWeight.w400,
        ),
        // maxLength: widget.password ? 18 : ,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: ColorsStyles.blackColor,
        textCapitalization: widget.isText
            ? TextCapitalization.sentences
            : TextCapitalization.none,
        // inputFormatters: widget.isEmailOrPassword || widget.isText
        //     ? []
        //     : [CustomInputFormatterNumber(numberAndEmail: widget.emailOrNumber)],
        keyboardType: widget.type,
        obscureText: widget.isEmailOrPassword,
        decoration: InputDecoration.collapsed(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: ColorsStyles.textFiledHintColor,
          ),
        ),
      ),
    );
  }
}
