import 'package:flutter/material.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_in/view/sign_in.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_up/view/sign_up.dart';
import 'package:grow_food/features/presentation/home/home.dart';
import 'package:grow_food/features/presentation/root_screen/presentation/root_screen/view/root_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const RootScreen(),
        );
      case '/SignIn':
        return MaterialPageRoute(
          builder: (context) => const SignIn(),
        );
      case '/SignUp':
        return MaterialPageRoute(
          builder: (context) => const SignUp(),
        );
      case '/HomeView':
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Error!',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  });
}
