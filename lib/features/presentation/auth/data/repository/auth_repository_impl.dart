import 'package:grow_food/features/presentation/auth/data/datasource/auth_remote_datasorce.dart';
import 'package:grow_food/features/presentation/auth/domain/entiti/user_sign_in_entiti.dart';
import 'package:grow_food/features/presentation/auth/domain/entiti/user_sign_up_entiti.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_food/features/presentation/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemotehDatasource;

  AuthRepositoryImpl({required this.authRemotehDatasource});
  @override
  Future<Either<Failure, UserSignUpEntiti>> signUpUser(
      {required String userName,
      required String phoneNumber,
      required String email,
      required String password}) async {
    try {
      final userSignUp = await authRemotehDatasource.signUpUser(
        userName: userName,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
      );
      return Right(userSignUp);
    } catch (e) {
      print('$e Ошибка в репозитории: SignUpUser');
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserSignInEntiti>> signInUser({
    required String emailOrPhoneNumber,
    required String password,
  }) async {
    try {
      final userSignIn = await authRemotehDatasource.signInUser(
          emailOrPhoneNumber: emailOrPhoneNumber, password: password);
      return Right(userSignIn);
    } catch (e) {
      print('$e Ошибка в репозитории: SignInUser');
      return Left(ServerFailure());
    }
  }
}
