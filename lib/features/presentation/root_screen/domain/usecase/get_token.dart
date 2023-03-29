import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/core/usecase/usecase.dart';
import 'package:grow_food/features/presentation/root_screen/domain/repository/root_screen_repository.dart';

class GetToken extends UseCase<String, GetTokenParams> {
  final RootScreenRepository rootScreenRepository;

  GetToken({required this.rootScreenRepository});
  @override
  Future<Either<Failure, String>> call(GetTokenParams params) async {
    return await rootScreenRepository.getToken();
  }
}

class GetTokenParams extends Equatable {
  @override
  List<Object?> get props => [];
}
