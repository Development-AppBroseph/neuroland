import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_food/features/presentation/profile/domain/usecase/get_profile.dart';
import 'package:grow_food/features/presentation/profile/presentation/controller/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfile getProfile;
  ProfileCubit({required this.getProfile}) : super(ProfileInitialState());

  Future<void> fetchProfile() async {
    try {
      final getedProfile = await getProfile.call(GetProfileParams());
      getedProfile.fold(
        (error) => emit(ProfileErrorState(errorMessage: error.toString())),
        (data) => emit(ProfileLoadedState(profile: data)),
      );
    } catch (e) {
      emit(ProfileErrorState(errorMessage: e.toString()));
    }
  }
}
