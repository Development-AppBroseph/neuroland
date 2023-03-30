import 'package:grow_food/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_food/features/presentation/root_screen/data/local_datasource/local_datasource.dart';
import 'package:grow_food/features/presentation/root_screen/domain/repository/root_screen_repository.dart';

class RootScreenRepositoryImpl extends RootScreenRepository {
  final LocalDatasource localDatasource;

  RootScreenRepositoryImpl({required this.localDatasource});
  @override
  Future<Either<Failure, String>> getToken() async {
    try {
      final token = await localDatasource.getToken();
      return Right(token);
    } catch (e) {
      return Left(CacheFailure(error: e.toString()));
    }
  }
}
