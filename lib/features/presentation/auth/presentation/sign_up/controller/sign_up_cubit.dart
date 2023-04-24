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
    required String password,
    required int id,
    required Function() onSuccess,
  }) async {
    try {
      SmartDialogFunctions.showCustomLoader();

      final result = await signUpUser.call(
        SignUpUserParams(
          userName: userName,
          phoneNumber: phoneNumber,
          email: email,
          password: password,
          id: id,
        ),
      );
      result.fold(
        (error) async {
          await SmartDialog.dismiss();
          SmartDialogFunctions.showErrorDilog(title: error.error);
        },
        (data) async {
          await SmartDialog.dismiss();
          await onSuccess();
        },
      );
    } catch (_) {
      emit(SignUpErrorState(message: 'Поломалось епта'));
    }
  }
}
