import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/invite_link_entiti.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/profile_entiti.dart';
import 'package:grow_food/features/presentation/profile/domain/usecase/get_profile.dart';
import 'package:grow_food/features/presentation/profile/domain/usecase/get_ref.dart';
import 'package:grow_food/features/presentation/profile/presentation/controller/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfile getProfile;
  final GetLink getLink;
  ProfileCubit({
    required this.getProfile,
    required this.getLink,
  }) : super(ProfileInitialState());

  Future<void> fetchProfile() async {
    try {
      ProfileEntiti? profileEntiti;
      InviteLinkEntiti? inviteLinkEntiti;
      final getedProfile = await getProfile.call(GetProfileParams());
      final getedLink = await getLink.call(GetRefParams());

      getedProfile.fold(
        (error) => emit(ProfileErrorState(errorMessage: error.toString())),
        (data) => profileEntiti = data,
      );
      getedLink.fold(
        (error) => emit(ProfileErrorState(errorMessage: error.toString())),
        (data) => inviteLinkEntiti = data,
      );
      emit(
          ProfileLoadedState(profile: profileEntiti!, link: inviteLinkEntiti!));
    } catch (e) {
      emit(ProfileErrorState(errorMessage: e.toString()));
    }
  }
}
