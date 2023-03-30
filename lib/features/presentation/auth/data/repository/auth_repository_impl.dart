import 'package:grow_food/features/presentation/auth/data/datasource/local_datasource/auth_local_datasource.dart';
import 'package:grow_food/features/presentation/auth/data/datasource/remote_datasource/auth_remote_datasorce.dart';
import 'package:grow_food/features/presentation/auth/domain/entiti/user_sign_in_entiti.dart';
import 'package:grow_food/features/presentation/auth/domain/entiti/user_sign_up_entiti.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_food/features/presentation/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemotehDatasource;
  final AuthLocalDatasource authLocalDatasource;

  AuthRepositoryImpl({
    required this.authRemotehDatasource,
    required this.authLocalDatasource,
  });
  @override
  Future<Either<Failure, UserSignUpEntiti>> signUpUser(
      {required String userName,
      required String phoneNumber,
      required String email,
      required String password,
      required int id}) async {
    try {
      final userSignUp = await authRemotehDatasource.signUpUser(
        userName: userName,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
        id: id,
      );
      authLocalDatasource.saveUserToken(userSignUp.authToken);
      return Right(userSignUp);
    } catch (error) {
      print('$error Ошибка в репозитории: SignUpUser');
      return Left(ServerFailure(error: error.toString()));
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
      authLocalDatasource.saveUserToken(userSignIn.authToken);
      return Right(userSignIn);
    } catch (error) {
      print('$error Ошибка в репозитории: SignInUser');
      return Left(ServerFailure(error: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      final userLogOut = await authLocalDatasource.deleteUserToken();
      return Right(userLogOut);
    } catch (e) {
      return Left(CacheFailure(error: e.toString()));
    }
  }
}
