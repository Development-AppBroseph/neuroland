import 'package:equatable/equatable.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/invite_link_entiti.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/profile_entiti.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoadedState extends ProfileState {
  final ProfileEntiti profile;
  final InviteLinkEntiti link;

  ProfileLoadedState({
    required this.profile,
    required this.link,
  });

  @override
  List<Object?> get props => [profile];
}

class ProfileErrorState extends ProfileState {
  final String errorMessage;

  ProfileErrorState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
