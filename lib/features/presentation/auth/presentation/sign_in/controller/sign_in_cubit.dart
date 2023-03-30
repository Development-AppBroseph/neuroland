import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:grow_food/core/helpers/functions/functions.dart';
import 'package:grow_food/features/presentation/auth/domain/usecases/sign_in_user.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_in/controller/sign_in_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class SignInCubit extends HydratedCubit<SignInStates> {
  final SignInUser signInUser;
  SignInCubit({required this.signInUser})
      : super(SignInStates.signInEmptyState);

  Future<void> signIn({
    required String emailOrPhoneNumber,
    required String password,
    required Function() onSuccess,
  }) async {
    try {
      if (emailOrPhoneNumber == '' || password == '') {
        SmartDilogFunctions.showErrorDilog(title: 'Есть не заполненные поля');
      } else {
        emit(SignInStates.signInLoadingState);
        if (state == SignInStates.signInLoadingState) {
          SmartDilogFunctions.showCustomLoader();
        }
        final result = await signInUser.call(
          SignInUserParams(
            emailOrPhoneNumber: emailOrPhoneNumber,
            password: password,
          ),
        );
        result.fold(
          (error) async {
            emit(SignInStates.signInErrorState);
            await SmartDialog.dismiss();
            SmartDilogFunctions.showErrorDilog(title: error.error);
          },
          (data) async {
            emit(SignInStates.signInLoadedState);
            await SmartDialog.dismiss();
            await onSuccess();
          },
        );
      }
    } catch (_) {
      emit(SignInStates.signInErrorState);
    }
  }

  @override
  SignInStates? fromJson(Map<String, dynamic> json) {
    return SignInStates.values[json['state'] as int];
  }

  @override
  Map<String, dynamic>? toJson(SignInStates state) {
    return {
      'state': state.index,
    };
  }
}
