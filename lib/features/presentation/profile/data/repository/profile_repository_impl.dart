import 'package:dartz/dartz.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/features/presentation/profile/data/datasource/remote_profile_datasource/remote_profile_datasource.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/invite_link_entiti.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/profile_entiti.dart';
import 'package:grow_food/features/presentation/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final RemoteProfileDatasource remoteProfileDatasource;

  ProfileRepositoryImpl({required this.remoteProfileDatasource});
  @override
  Future<Either<Failure, ProfileEntiti>> getProfile() async {
    try {
      final data = await remoteProfileDatasource.getProfile();
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, InviteLinkEntiti>> getRef() async {
    try {
      final data = await remoteProfileDatasource.getRef();
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntiti>> editAvatar(
      {required String avatar}) async {
    try {
      final data = await remoteProfileDatasource.editAvatar(avatar: avatar);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntiti>> editEmail(
      {required String email}) async {
    try {
      final data = await remoteProfileDatasource.editEmail(email: email);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntiti>> editName(
      {required String name}) async {
    try {
      final data = await remoteProfileDatasource.editName(name: name);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntiti>> editNumber(
      {required String number}) async {
    try {
      final data = await remoteProfileDatasource.editNumber(number: number);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
