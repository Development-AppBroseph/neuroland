import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/core/usecase/usecase.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/profile_entiti.dart';
import 'package:grow_food/features/presentation/profile/domain/repository/profile_repository.dart';

class EditAvatar extends UseCase<ProfileEntiti, EditAvatarParams> {
  final ProfileRepository profileRepository;

  EditAvatar({required this.profileRepository});
  @override
  Future<Either<Failure, ProfileEntiti>> call(EditAvatarParams params) async {
    return await profileRepository.editAvatar(avatar: params.avatar);
  }
}

class EditAvatarParams extends Equatable {
  final String avatar;

  const EditAvatarParams({required this.avatar});
  @override
  List<Object?> get props => [avatar];
}
