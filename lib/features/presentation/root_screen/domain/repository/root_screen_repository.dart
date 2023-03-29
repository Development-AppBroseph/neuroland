import 'package:dartz/dartz.dart';
import 'package:grow_food/core/error/failure.dart';

abstract class RootScreenRepository{
  Future<Either<Failure, String>> getToken();
}