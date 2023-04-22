import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/core/usecase/usecase.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/profile_entiti.dart';
import 'package:grow_food/features/presentation/profile/domain/repository/profile_repository.dart';

class EditName extends UseCase<ProfileEntiti, EditNameParams> {
  final ProfileRepository profileRepository;

  EditName({required this.profileRepository});

  @override
  Future<Either<Failure, ProfileEntiti>> call(EditNameParams params) async {
    return await profileRepository.editName(name: params.name);
  }
}

class EditNameParams extends Equatable {
  final String name;

  const EditNameParams({required this.name});
  @override
  List<Object?> get props => [name];
}
