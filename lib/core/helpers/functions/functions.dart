import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/widgets/push_error.dart';

class SmartDialogFunctions {
  static Future<void> showCustomLoader() {
    return SmartDialog.showLoading(
      animationType: SmartAnimationType.scale,
      msg: '',
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(15),
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
    // return SmartDialog.showToast(
    //   '',
    //   animationType: SmartAnimationType.fade,
    //   maskColor: Colors.transparent,
    //   displayTime: const Duration(seconds: 2),
    //   clickMaskDismiss: false,
    //   alignment: Alignment.topCenter,
    //   usePenetrate: true,
    //   builder: (context) => PushError(
    //     title: title,
    //   ),
    // );
    return SmartDialog.show(
      animationType: SmartAnimationType.fade,
      maskColor: Colors.transparent,
      displayTime: const Duration(seconds: 2),
      clickMaskDismiss: false,
      usePenetrate: true,
      useSystem: true,
      alignment: Alignment.topCenter,
      builder: (context) => SafeArea(
        child: PushError(
          title: title,
        ),
      ),
    );
  }

  static Future<void> showInfoDilog({required String title}) {
    return SmartDialog.show(
      animationType: SmartAnimationType.fade,
      maskColor: Colors.transparent,
      displayTime: const Duration(seconds: 1),
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

String formatTime(int seconds) {
  return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
}

// class BottomSheets {
//   static void showVideoBottomsheet(BuildContext context,
//       {required String videoUrl, required String description, required String titleVideo}) {
    // showMaterialModalBottomSheet(
    //   context: context,
    //   animationCurve: Curves.easeInOutQuint,
    //   elevation: 12,
    //   barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
    //   duration: const Duration(milliseconds: 600),
    //   backgroundColor: Colors.transparent,
    //   enableDrag: true,
    //   builder: (context) => Container(
    //     height: MediaQuery.of(context).size.height - 100,
    //     decoration: const BoxDecoration(
    //       color: Color(0xffF3F3F3),
    //     ),
    //     child: VideoPage(
    //       videoUrl: videoUrl,
    //       description: description,
    //       titleVideo: titleVideo,
    //     ),
    //   ),
  //   );
  // }
// }
