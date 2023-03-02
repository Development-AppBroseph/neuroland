import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';

import '../custom_input_formatter_number.dart';

class CustomTextField extends StatefulWidget {
  final Color color;
  final TextEditingController? controller;
  final TextInputType? type;
  final String hintText;
  final bool password;
  const CustomTextField({
    super.key,
    required this.color,
    required this.controller,
    this.type,
    required this.hintText,
    this.password = false,
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
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: widget.color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        controller: widget.controller,
        style: TextStyle(
          fontFamily: 'Mons',
          fontSize: 20.sp,
          color: ColorsStyles.blackColor,
          fontWeight: FontWeight.w400,
        ),
        // maxLength: widget.password ? 18 : ,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: ColorsStyles.blackColor,
        inputFormatters: widget.password ? [] : [CustomInputFormatterNumber()],
        keyboardType: widget.type,
        obscureText: widget.password,
        decoration: InputDecoration.collapsed(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontFamily: 'Mons',
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xff161616).withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
