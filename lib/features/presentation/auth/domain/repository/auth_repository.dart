import 'package:dartz/dartz.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/features/presentation/auth/domain/entiti/user_sign_in_entiti.dart';
import 'package:grow_food/features/presentation/auth/domain/entiti/user_sign_up_entiti.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserSignUpEntiti>> signUpUser({
    required String userName,
    required String phoneNumber,
    required String email,
    required String password,
    required int id,
  });
  Future<Either<Failure, UserSignInEntiti>> signInUser({
    required String emailOrPhoneNumber,
    required String password,
  });
  Future<Either<Failure, void>> logOut();
  Future<Either<Failure, UserSignInEntiti>> refreshToken();
}
