import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/core/usecase/usecase.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/invite_link_entiti.dart';
import 'package:grow_food/features/presentation/profile/domain/repository/profile_repository.dart';

class GetLink extends UseCase<InviteLinkEntiti, GetRefParams> {
  final ProfileRepository profileRepository;

  GetLink({required this.profileRepository});
  @override
  Future<Either<Failure, InviteLinkEntiti>> call(GetRefParams params) async {
    return await profileRepository.getRef();
  }
}

class GetRefParams extends Equatable {
  @override
  List<Object?> get props => [];
}
