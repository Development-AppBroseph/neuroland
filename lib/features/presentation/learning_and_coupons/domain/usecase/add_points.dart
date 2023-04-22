import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/core/usecase/usecase.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/repository/courses_video_repository.dart';

class AddPoints extends UseCase<void, AddPointParams> {
  final CoursesVideoRepository coursesVideoRepository;

  AddPoints({required this.coursesVideoRepository});

  @override
  Future<Either<Failure, void>> call(AddPointParams params) async {
    return await coursesVideoRepository.addPoints(params.videoId);
  }
}

class AddPointParams extends Equatable {
  final int videoId;

  const AddPointParams({required this.videoId});
  @override
  List<Object?> get props => [videoId];
}
