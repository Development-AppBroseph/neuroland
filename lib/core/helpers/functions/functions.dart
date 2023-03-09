import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/widgets/push_error.dart';

class SmartDilogFunctions {
  static Future<void> showCustomLoader() {
    return SmartDialog.showLoading(
      animationType: SmartAnimationType.scale,
      msg: '',
      builder: (context) {
        return Container(
          height: 80.h,
          width: 80.w,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: ColorsStyles.whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const CircularProgressIndicator(
            color: ColorsStyles.buttonColor,
            strokeWidth: 3,
          ),
        );
      },
    );
  }

  static Future<void> showErrorDilog({required String title}) {
    return SmartDialog.show(
      animationType: SmartAnimationType.fade,
      maskColor: Colors.transparent,
      displayTime: const Duration(seconds: 2),
      clickMaskDismiss: false,
      usePenetrate: true,
      useSystem: true,
      builder: (context) => SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: PushError(
            title: title,
          ),
        ),
      ),
    );
  }
}
