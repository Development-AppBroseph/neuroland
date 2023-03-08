import 'package:dartz/dartz.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/features/presentation/auth/domain/entiti/user_sign_up_entiti.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserSignUpEntiti>> signUpUser({
    required String userName,
    required String phoneNumber,
    required String email,
    required String password,
  });
}
