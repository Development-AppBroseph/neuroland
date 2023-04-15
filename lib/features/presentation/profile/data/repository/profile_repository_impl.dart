import 'package:grow_food/features/presentation/profile/data/datasource/remote_profile_datasource/remote_profile_datasource.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/profile_entiti.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:dartz/dartz.dart';
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
}
