import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/core/usecase/usecase.dart';
import 'package:grow_food/features/presentation/auth/domain/repository/auth_repository.dart';

class UserLogOut extends UseCase<void, LogOutParams> {
  final AuthRepository authRepository;

  UserLogOut({required this.authRepository});
  @override
  Future<Either<Failure, void>> call(LogOutParams params) async {
    return await authRepository.logOut();
  }
}

class LogOutParams extends Equatable {
  @override
  List<Object?> get props => [];
}
