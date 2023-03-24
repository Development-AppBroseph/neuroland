import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:grow_food/core/helpers/functions/functions.dart';
import 'package:grow_food/features/presentation/auth/domain/usecases/sign_up_user.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_up/controller/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUser signUpUser;
  SignUpCubit({required this.signUpUser}) : super(SignUpEmptyState());

  Future<void> signUp({
    required String userName,
    required String phoneNumber,
    required String email,
    required int id,
    required Function() onSuccess,
  }) async {
    try {
      emit(SignUpLoadingState());
      if (state is SignUpLoadingState) {
        SmartDilogFunctions.showCustomLoader();
      }
      final result = await signUpUser.call(
        SignUpUserParams(
          userName: userName,
          phoneNumber: phoneNumber,
          email: email,
          id: id,
        ),
      );
      result.fold(
        (error) async {
          emit(SignUpErrorState(message: "Поломалось епта"));
          await SmartDialog.dismiss();
          SmartDilogFunctions.showErrorDilog(title: error.toString());
        },
        (data) async {
          emit(SignUpLoadedState());
          await SmartDialog.dismiss();
          await SmartDilogFunctions.showInfoDilog(
              title: 'Данные для входа придут на почту');
          await onSuccess();
        },
      );
    } catch (_) {
      emit(SignUpErrorState(message: 'Поломалось епта'));
    }
  }
}
