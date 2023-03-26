import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:grow_food/core/helpers/functions/functions.dart';
import 'package:grow_food/features/presentation/auth/domain/usecases/sign_in_user.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_in/controller/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUser signInUser;
  SignInCubit({required this.signInUser}) : super(SignInEmptyState());

  Future<void> signIn({
    required String emailOrPhoneNumber,
    required String password,
    required Function() onSuccess,
  }) async {
    try {
      emit(SignInLoadingState());
      if (state is SignInLoadingState) {
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
          emit(SignInErrorState(message: 'Error epta'));
          await SmartDialog.dismiss();
          SmartDilogFunctions.showErrorDilog(title: 'Неверный логин или пароль');
        },
        (data) async {
          emit(SignInLoadedState());
          await SmartDialog.dismiss();
          await onSuccess();
        },
      );
    } catch (_) {
      emit(SignInErrorState(message: 'Поломалось епта'));
    }
  }
}
