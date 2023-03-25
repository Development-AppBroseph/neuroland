import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/core/usecase/usecase.dart';
import 'package:grow_food/features/presentation/auth/domain/entiti/user_sign_up_entiti.dart';
import 'package:grow_food/features/presentation/auth/domain/repository/auth_repository.dart';

class SignUpUser implements UseCase<UserSignUpEntiti, SignUpUserParams> {
  final AuthRepository authRepository;

  SignUpUser({required this.authRepository});
  @override
  Future<Either<Failure, UserSignUpEntiti>> call(
      SignUpUserParams params) async {
    return await authRepository.signUpUser(
      userName: params.userName,
      phoneNumber: params.phoneNumber,
      email: params.email,
      password: params.password,
      id: params.id,
    );
  }
}

class SignUpUserParams extends Equatable {
  final String userName;
  final String phoneNumber;
  final String email;
  final String password;

  final int id;

  const SignUpUserParams({
    required this.userName,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.id,
  });
  @override
  List<Object?> get props => [
        userName,
        phoneNumber,
        email,
        id,
      ];
}
