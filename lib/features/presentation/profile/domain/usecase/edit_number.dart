import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/core/usecase/usecase.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/profile_entiti.dart';
import 'package:grow_food/features/presentation/profile/domain/repository/profile_repository.dart';

class EditNumber extends UseCase<ProfileEntiti, EditNumberParams> {
  final ProfileRepository profileRepository;

  EditNumber({required this.profileRepository});
  @override
  Future<Either<Failure, ProfileEntiti>> call(EditNumberParams params) async {
    return await profileRepository.editNumber(number: params.number);
  }
}

class EditNumberParams extends Equatable {
  final String number;

  const EditNumberParams({required this.number});
  @override
  List<Object?> get props => [];
}
