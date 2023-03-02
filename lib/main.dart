import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/features/home/home.dart';
import 'package:grow_food/rout_generatoe.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/SignIn',
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    ),
  );
}
