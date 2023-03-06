import 'package:flutter/material.dart';

const Color accentColor = Color.fromRGBO(50, 52, 139, 1);

const Color redColor = Color.fromRGBO(190, 39, 46, 1);
const Color backgroundColor = Color(0xffF9F9FB);

abstract class ColorsStyles {
  static const Color backgroundColor = Color(0xffF9F9FB);
  static const List<Color> gradientRedColor = [
    Color(0xffFF414A),
    Color(0xffBE272E)
  ];
  static const List<Color> gradientBlueColor = [
    Color(0xff32348B),
    Color(0xff4246CF),
  ];
  static const Color blackColor = Color(0xff000000);
  static const Color whiteColor = Color(0xffffffff);
  static const Color backgroundTextField = Color(0xfff1f1f1);
  static const Color mainTextColor = Color(0xff363636); 
  static const Color textFiledHintColor = Color(0xff6B6B6B);
  static const Color buttonColor = Color(0xff2E3190);
}
