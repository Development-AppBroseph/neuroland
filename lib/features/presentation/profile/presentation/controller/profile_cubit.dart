import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_food/core/helpers/functions/functions.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/invite_link_entiti.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/profile_entiti.dart';
import 'package:grow_food/features/presentation/profile/domain/usecase/edit_avatar.dart';
import 'package:grow_food/features/presentation/profile/domain/usecase/edit_email.dart';
import 'package:grow_food/features/presentation/profile/domain/usecase/edit_name.dart';
import 'package:grow_food/features/presentation/profile/domain/usecase/edit_number.dart';
import 'package:grow_food/features/presentation/profile/domain/usecase/get_profile.dart';
import 'package:grow_food/features/presentation/profile/domain/usecase/get_ref.dart';
import 'package:grow_food/features/presentation/profile/presentation/controller/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfile getProfile;
  final GetLink getLink;
  final EditNumber editNumber;
  final EditAvatar editAvatar;
  final EditName editName;
  final EditEmail editEmail;
  ProfileCubit({
    required this.getProfile,
    required this.getLink,
    required this.editNumber,
    required this.editAvatar,
    required this.editName,
    required this.editEmail,
  }) : super(ProfileInitialState());

  Future<void> fetchProfile() async {
    try {
      ProfileEntiti? profileEntiti;
      InviteLinkEntiti? inviteLinkEntiti;
      final getedProfile = await getProfile.call(GetProfileParams());
      // final getedLink = await getLink.call(GetRefParams());
      emit(ProfileLoadingState());
      getedProfile.fold(
        (error) => emit(ProfileErrorState(errorMessage: error.toString())),
        (data) => profileEntiti = data,
      );
      // getedLink.fold(
      //   (error) => emit(ProfileErrorState(errorMessage: error.toString())),
      //   (data) => inviteLinkEntiti = data,
      // );
      emit(ProfileLoadedState(
          profile: profileEntiti!, link: InviteLinkEntiti(inviteLink: '')));
    } catch (e) {
      emit(ProfileErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> editUserNumber(String number) async {
    try {
      final getedNumber =
          await editNumber.call(EditNumberParams(number: number));
      getedNumber.fold(
          (error) => SmartDialogFunctions.showErrorDilog(title: error.error),
          (data) => emit(ProfileInitialState()));
    } catch (e) {
      emit(ProfileErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> editUserAvatar(String avatar) async {
    try {
      final getedAvatar =
          await editAvatar.call(EditAvatarParams(avatar: avatar));
      getedAvatar.fold(
        (error) => SmartDialogFunctions.showErrorDilog(title: error.error),
        (data) => emit(ProfileInitialState()),
      );
    } catch (e) {
      emit(ProfileErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> editUserName(String name) async {
    try {
      final getedName = await editName.call(EditNameParams(name: name));
      getedName.fold(
        (error) => SmartDialogFunctions.showErrorDilog(title: error.error),
        (data) => emit(ProfileInitialState()),
      );
    } catch (e) {
      emit(ProfileErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> editUserEmail(String email) async {
    try {
      final getedName = await editEmail.call(EditEmailParams(email: email));
      getedName.fold(
        (error) => SmartDialogFunctions.showErrorDilog(title: error.error),
        (data) => emit(ProfileInitialState()),
      );
    } catch (e) {
      emit(ProfileErrorState(errorMessage: e.toString()));
    }
  }
}
