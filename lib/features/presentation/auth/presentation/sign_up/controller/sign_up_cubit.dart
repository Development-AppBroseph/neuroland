import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:grow_food/core/helpers/widgets/push_error.dart';
import 'package:grow_food/features/presentation/auth/domain/usecases/sign_up_user.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_up/controller/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUser signUpUser;
  SignUpCubit({required this.signUpUser}) : super(SignUpEmptyState());

  Future<void> signUp({
    required String userName,
    required String phoneNumber,
    required String email,
    required String password,
    required Function() onSuccess,
  }) async {
    try {
      emit(SignUpLoadingState());
      if (state is SignUpLoadingState) {
        SmartDialog.showLoading();
      } else {
        SmartDialog.dismiss();
      }
      final result = await signUpUser.call(
        SignUpUserParams(
          userName: userName,
          phoneNumber: phoneNumber,
          email: email,
          password: password,
        ),
      );
      result.fold((error) async {
        emit(SignUpErroeState());
        await SmartDialog.dismiss();
        SmartDialog.show(
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
                title: error.toString(),
              ),
            ),
          ),
        );
      }, (data) async {
        emit(SignUpLoadedState());
        await SmartDialog.dismiss();
        await onSuccess();
      });
    } catch (_) {}
  }
}
