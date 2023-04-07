import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/core/usecase/usecase.dart';
import 'package:grow_food/features/presentation/auth/domain/entiti/user_sign_in_entiti.dart';
import 'package:grow_food/features/presentation/auth/domain/repository/auth_repository.dart';

class RefreshToken extends UseCase<UserSignInEntiti, RefreshTokenParams> {
  final AuthRepository authRepository;

  RefreshToken({required this.authRepository});
  @override
  Future<Either<Failure, UserSignInEntiti>> call(
      RefreshTokenParams params) async {
    return await authRepository.refreshToken();
  }
}

class RefreshTokenParams extends Equatable {
  @override
  List<Object?> get props => [];
}
