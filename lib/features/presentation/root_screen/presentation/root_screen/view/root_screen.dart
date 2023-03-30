import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_in/controller/sign_in_cubit.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_in/controller/sign_in_state.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_in/view/sign_in.dart';
import 'package:grow_food/features/presentation/home/home.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInStates>(
      builder: (context, state) {
        if (state == SignInStates.signInEmptyState) {
          return const SignIn();
        } else if (state == SignInStates.signInLoadedState) {
          return const HomeView();
        }
        return const SignIn();
      },
    );
  }
}
