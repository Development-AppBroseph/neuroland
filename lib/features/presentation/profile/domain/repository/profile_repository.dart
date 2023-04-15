import 'package:dartz/dartz.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/profile_entiti.dart';

abstract class ProfileRepository{
  Future<Either<Failure, ProfileEntiti>> getProfile();
} 