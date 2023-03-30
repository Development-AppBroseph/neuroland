import 'package:grow_food/features/presentation/root_screen/data/local_datasource/local_datasource.dart';
import 'package:grow_food/features/presentation/root_screen/domain/usecase/get_token.dart';
import 'package:grow_food/features/presentation/root_screen/presentation/root_screen/controllers/root_screen_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class RootScreenCubit extends HydratedCubit<ScreenState> {
  final GetToken getToken;
  final LocalDatasource localDatasource;
  RootScreenCubit({required this.getToken, required this.localDatasource})
      : super(ScreenState.rootScreenInitialState);

  Future<void> getUserToken() async {
    try {
      final userToken = await getToken.call(
        GetTokenParams(),
      );
      userToken.fold(
        (error) => emit(ScreenState.rootScreenNotHaveTokenState),
        (data) {
          if (data != '') {
            emit(ScreenState.rootScreenHaveTokenState);
          } else {
            emit(ScreenState.rootScreenNotHaveTokenState);
          }
        },
      );
      // final tokenUser = await localDatasource.getToken();
      // if (tokenUser == '') {
      //   emit(ScreenState.rootScreenNotHaveTokenState);
      // } else {
      //   emit(ScreenState.rootScreenHaveTokenState);
      // }
    } catch (e) {
      emit(ScreenState.rootScreenNotHaveTokenState);
    }
  }

  @override
  ScreenState? fromJson(Map<String, dynamic> json) {
    return ScreenState.values[json['state'] as int];
  }

  @override
  Map<String, dynamic>? toJson(ScreenState state) {
    return {
      'state': state.index,
    };
  }
}
