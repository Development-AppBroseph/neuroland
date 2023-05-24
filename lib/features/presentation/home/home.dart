import 'dart:io';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/constants/svg_and_img.dart';
import 'package:grow_food/features/presentation/chat/view/chat.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/presentation/coupons/view/coupons_view.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/presentation/learning/view/actual_courses_view.dart';
import 'package:grow_food/features/presentation/profile/presentation/view/profile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  List pages = [
    const StudiesView(),
    const CouponsView(),
    const ChatView(),
    const ProfileView(),
  ];
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      FirebaseDynamicLinks.instance.getInitialLink().then((value) {
        if (value != null) parseRefCode(value);
      });
    }
    FirebaseDynamicLinks.instance.onLink.listen((event) {
      parseRefCode(event);
    });
  }

  Future<String?> parseRefCode(PendingDynamicLinkData event) async {
    String? refCode = event.link.queryParameters['ref_code'];
    return refCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        elevation: .5,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        // selectedItemColor: accentColor,
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'Mons',
          foreground: Paint()..shader = linearGradient,
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 15.sp,
          fontFamily: 'Mons',
          fontWeight: FontWeight.w700,
        ),
        items: [
          BottomNavigationBarItem(
            icon: ShaderMask(
              shaderCallback: (bounds) {
                const Rect rect = Rect.fromLTRB(0, 0, 25, 40);
                return LinearGradient(
                  colors: _selectedIndex == 0
                      ? ColorsStyles.gradientRedColor
                      : [
                          const Color(0xffCECECE),
                          const Color(0xffCECECE),
                        ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(rect);
              },
              child: SvgPicture.asset(
                SvgImg.studies,
                height: 25.h,
                width: 40.w,
              ),
            ),
            label: 'Учёба',
          ),
          BottomNavigationBarItem(
            icon: ShaderMask(
              shaderCallback: (bounds) {
                const Rect rect = Rect.fromLTRB(0, 0, 25, 40);
                return LinearGradient(
                  colors: _selectedIndex == 1
                      ? ColorsStyles.gradientRedColor
                      : [
                          const Color(0xffCECECE),
                          const Color(0xffCECECE),
                        ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(rect);
              },
              child: SvgPicture.asset(
                SvgImg.cupones,
                height: 25.h,
                width: 40.w,
              ),
            ),
            label: 'Купоны',
          ),
          BottomNavigationBarItem(
            icon: ShaderMask(
              shaderCallback: (bounds) {
                const Rect rect = Rect.fromLTRB(0, 0, 25, 40);
                return LinearGradient(
                  colors: _selectedIndex == 2
                      ? ColorsStyles.gradientRedColor
                      : [
                          const Color(0xffCECECE),
                          const Color(0xffCECECE),
                        ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(rect);
              },
              child: SvgPicture.asset(
                SvgImg.chat,
                height: 25.h,
                width: 40.w,
              ),
            ),
            label: 'Чат',
          ),
          BottomNavigationBarItem(
            icon: ShaderMask(
              shaderCallback: (bounds) {
                const Rect rect = Rect.fromLTRB(0, 0, 25, 40);
                return LinearGradient(
                  colors: _selectedIndex == 3
                      ? ColorsStyles.gradientRedColor
                      : [
                          const Color(0xffCECECE),
                          const Color(0xffCECECE),
                        ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(rect);
              },
              child: SvgPicture.asset(
                SvgImg.profile,
                height: 25.h,
                width: 40.w,
              ),
            ),
            label: 'Профиль',
          ),
        ],
      ),
      body: pages.elementAt(_selectedIndex),
    );
  }
}
