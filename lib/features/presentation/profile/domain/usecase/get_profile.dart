import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/core/usecase/usecase.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/profile_entiti.dart';
import 'package:grow_food/features/presentation/profile/domain/repository/profile_repository.dart';

class GetProfile extends UseCase<ProfileEntiti, GetProfileParams> {
  final ProfileRepository profileRepository;

  GetProfile({required this.profileRepository});

  @override
  Future<Either<Failure, ProfileEntiti>> call(GetProfileParams params) async {
    return await profileRepository.getProfile();
  }
}

class GetProfileParams extends Equatable {
  @override
  List<Object?> get props => [];
}
