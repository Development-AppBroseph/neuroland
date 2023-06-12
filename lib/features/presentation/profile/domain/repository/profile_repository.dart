import 'package:dartz/dartz.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/invite_link_entiti.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/profile_entiti.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileEntiti>> getProfile();
  Future<Either<Failure, InviteLinkEntiti>> getRef();
  Future<Either<Failure, ProfileEntiti>> editName({required String name});
  Future<Either<Failure, ProfileEntiti>> editNumber({required String number});
  Future<Either<Failure, ProfileEntiti>> editEmail({required String email});
  Future<Either<Failure, ProfileEntiti>> editAvatar({required String avatar});
  Future<Either<Failure, void>> deleteAccount();
  
}
