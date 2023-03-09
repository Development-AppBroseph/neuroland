import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/core/usecase/usecase.dart';
import 'package:grow_food/features/presentation/auth/domain/entiti/user_sign_in_entiti.dart';
import 'package:grow_food/features/presentation/auth/domain/repository/auth_repository.dart';

class SignInUser implements UseCase<UserSignInEntiti, SignInUserParams> {
  final AuthRepository authRepository;

  SignInUser({required this.authRepository});
  @override
  Future<Either<Failure, UserSignInEntiti>> call(
      SignInUserParams params) async {
    return await authRepository.signInUser(
      emailOrPhoneNumber: params.emailOrPhoneNumber,
      password: params.password,
    );
  }
}

class SignInUserParams extends Equatable {
  final String emailOrPhoneNumber;
  final String password;

  const SignInUserParams({
    required this.emailOrPhoneNumber,
    required this.password,
  });
  @override
  List<Object?> get props => [
        emailOrPhoneNumber,
        password,
      ];
}
