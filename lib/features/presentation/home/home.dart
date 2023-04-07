import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/constants/svg_and_img.dart';
import 'package:grow_food/features/presentation/categories/categories.dart';
import 'package:grow_food/features/presentation/chat/chat.dart';
import 'package:grow_food/features/presentation/orders/orders.dart';
import 'package:grow_food/features/presentation/profile/profile.dart';
import 'package:grow_food/features/presentation/program/presentation/view/actual_courses_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  List pages = [
    const StudiesView(),
    CategoriesView(),
    const OrdersView(),
    const ProfileView(),
    const ChatView(),
  ];
  @override
  void initState() {
    super.initState();
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
        selectedItemColor: accentColor,
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          color: accentColor,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgImg.studies,
              height: 25.h,
              width: 40.w,
              color:
                  _selectedIndex == 0 ? accentColor : const Color(0xffCECECE),
            ),
            label: 'Учёба',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgImg.cupones,
              height: 25.h,
              width: 40.w,
              color:
                  _selectedIndex == 1 ? accentColor : const Color(0xffCECECE),
            ),
            label: 'Купоны',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgImg.chat,
              height: 25.h,
              width: 40.w,
              color:
                  _selectedIndex == 2 ? accentColor : const Color(0xffCECECE),
            ),
            label: 'Чат',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgImg.profile,
              height: 25.h,
              width: 40.w,
              color:
                  _selectedIndex == 3 ? accentColor : const Color(0xffCECECE),
            ),
            label: 'Профиль',
          ),
        ],
      ),
      body: pages.elementAt(_selectedIndex),
    );
  }
}
