import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_food/features/presentation/root_screen/domain/usecase/get_token.dart';
import 'package:grow_food/features/presentation/root_screen/presentation/root_screen/controllers/root_screen_state.dart';

class RootScreenCubit extends Cubit<RootScreenState> {
  final GetToken getToken;
  RootScreenCubit({required this.getToken}) : super(RootScreenInitialState());

  Future<void> getUserToken() async {
    try {
      final tokenUser = await getToken(GetTokenParams());
      tokenUser.fold(
        (error) => emit(RootScreenNotHaveTokenState()),
        (token) {
          if (token.isNotEmpty) {
            emit(RootScreenHaveTokenState());
          } else {
            emit(RootScreenNotHaveTokenState());
          }
        },
      );
    } catch (e) {
      emit(RootScreenNotHaveTokenState());
    }
  }
}
