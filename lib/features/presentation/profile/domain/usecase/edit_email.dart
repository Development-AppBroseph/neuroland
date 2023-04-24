import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/core/usecase/usecase.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/profile_entiti.dart';
import 'package:grow_food/features/presentation/profile/domain/repository/profile_repository.dart';

class EditEmail extends UseCase<ProfileEntiti, EditEmailParams> {
  final ProfileRepository profileRepository;

  EditEmail({required this.profileRepository});

  @override
  Future<Either<Failure, ProfileEntiti>> call(EditEmailParams params) async {
    return await profileRepository.editEmail(email: params.email);
  }
}

class EditEmailParams extends Equatable {
  final String email;

  const EditEmailParams({required this.email});
  @override
  List<Object?> get props => [email];
}
