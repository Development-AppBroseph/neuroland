import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grow_food/core/constants/bottom_nav_icons.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/features/categories/categories.dart';
import 'package:grow_food/features/chat/chat.dart';
import 'package:grow_food/features/orders/orders.dart';
import 'package:grow_food/features/profile/profile.dart';
import 'package:grow_food/features/program/program.dart';
import 'package:scale_button/scale_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          const ProgramView(),
          CategoriesView(),
          OrdersView(
            onTap: () {
              setState(() {
                _selectedIndex = 1;
                _pageController.jumpToPage(1);
              });
            },
          ),
          const ChatView(),
          const ProfileView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.jumpToPage(index);
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
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 33.h,
              child: SvgPicture.asset(
                'assets/icons/home.svg',
                height: 30.h,
                color: _selectedIndex == 0
                    ? accentColor
                    : const Color.fromARGB(255, 176, 176, 176),
              ),
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 33.h,
              child: SvgPicture.asset(
                'assets/icons/plus.svg',
                height: 27.h,
                color: _selectedIndex == 1
                    ? accentColor
                    : const Color.fromARGB(255, 176, 176, 176),
              ),
            ),
            label: 'Курсы',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 33.h,
              child: SvgPicture.asset(
                'assets/icons/calendar.svg',
                height: 27.h,
                color: _selectedIndex == 2
                    ? accentColor
                    : const Color.fromARGB(255, 176, 176, 176),
              ),
            ),
            label: 'Обучение',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 33.h,
              child: SvgPicture.asset(
                'assets/icons/chat.svg',
                height: 30.h,
                color: _selectedIndex == 3
                    ? accentColor
                    : const Color.fromARGB(255, 176, 176, 176),
              ),
            ),
            label: 'Чат',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 33.h,
              child: SvgPicture.asset(
                'assets/icons/user.svg',
                height: 30.h,
                color: _selectedIndex == 4
                    ? accentColor
                    : const Color.fromARGB(255, 176, 176, 176),
              ),
            ),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
