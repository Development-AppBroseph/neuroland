import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/core/usecase/usecase.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/video_curses/courses_video_entiti.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/repository/courses_video_repository.dart';

class GetCoursesVideo extends UseCase<CoursesVideoEntiti, CoursesVideoParams> {
  final CoursesVideoRepository coursesVideoRepository;

  GetCoursesVideo({required this.coursesVideoRepository});
  @override
  Future<Either<Failure, CoursesVideoEntiti>> call(
      CoursesVideoParams params) async {
    return await coursesVideoRepository.getCoursesVideo();
  }
}

class CoursesVideoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
