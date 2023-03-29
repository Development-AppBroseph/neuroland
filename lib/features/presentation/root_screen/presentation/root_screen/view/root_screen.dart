import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_in/view/sign_in.dart';
import 'package:grow_food/features/presentation/home/home.dart';
import 'package:grow_food/features/presentation/root_screen/presentation/root_screen/controllers/root_screen_cubit.dart';
import 'package:grow_food/features/presentation/root_screen/presentation/root_screen/controllers/root_screen_state.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootScreenCubit, RootScreenState>(
      builder: (context, state) {
        if (state is RootScreenInitialState) {
          context.read<RootScreenCubit>().getUserToken();
        } else if (state is RootScreenHaveTokenState) {
          return const HomeView();
        }
        return const SignIn();
      },
    );
  }
}
