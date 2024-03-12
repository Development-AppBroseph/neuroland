import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/custom_input_formaters/custom_input_formatter_number.dart';

class ProfileTextField extends StatelessWidget {
  final String title;
  final AsyncCallback onFinished;
  final TextEditingController controller;
  final bool isNumber;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  const ProfileTextField({
    Key? key,
    required this.controller,
    required this.onFinished,
    required this.title,
    required this.isNumber,
    required this.textInputType,
    required this.textCapitalization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      child: TextField(
        textCapitalization: textCapitalization,
        keyboardType: textInputType,
        onEditingComplete: () => onFinished(),
        cursorColor: ColorsStyles.blackColor,
        inputFormatters: isNumber ? [maskFormatter] : [],
        controller: controller,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900,
          fontFamily: 'Mons',
          color: ColorsStyles.blackColor,
        ),
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff6B6B6B),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff6B6B6B),
            ),
          ),
          contentPadding: const EdgeInsets.only(top: 10, bottom: 8),
          labelText: title,
          labelStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xff6B6B6B)),
          floatingLabelStyle: const TextStyle(
            fontSize: 15,
            fontFamily: 'Mons',
            fontWeight: FontWeight.w600,
            color: Color(0xff6B6B6B),
          ),
        ),
      ),
    );
  }
}
