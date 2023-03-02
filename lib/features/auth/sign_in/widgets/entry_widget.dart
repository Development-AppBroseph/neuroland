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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            title: 'Вход',
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomTextField(
            color: ColorsStyles.whiteColor,
            hintText: 'Телефон или почта',
            controller: widget.controllerNumberOrEmail,
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomTextField(
            color: ColorsStyles.whiteColor,
            hintText: 'Пароль',
            controller: widget.controllerPassword,
            password: true,
          ),
          SizedBox(
            height: 33.h,
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {},
              child: CustomText(
                title: 'Политика конфиденциальности',
                fontWeight: FontWeight.w400,
                color: Colors.grey.withOpacity(0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
