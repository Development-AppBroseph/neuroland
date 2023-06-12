import 'package:dartz/dartz.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/core/usecase/usecase.dart';
import 'package:grow_food/features/presentation/profile/domain/repository/profile_repository.dart';

class DeleteUserAccount implements UseCase<void, DeleteUserAccountParams>{
  final ProfileRepository profileRepository;

  DeleteUserAccount({required this.profileRepository});
  @override
  Future<Either<Failure, void>> call(DeleteUserAccountParams params) async {
    return await profileRepository.deleteAccount();
  }
}


class DeleteUserAccountParams{

}