import 'package:grow_food/features/presentation/learning_and_coupons/data/datasource/courses_video_datasource.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/video_curses/courses_video_entiti.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/repository/courses_video_repository.dart';

class CoursesVideoRepositoryImpl extends CoursesVideoRepository {
  final CoursesVideoDatasource coursesVideoDatasource;

  CoursesVideoRepositoryImpl({required this.coursesVideoDatasource});
  @override
  Future<Either<Failure, CoursesVideoEntiti>> getCoursesVideo() async {
    try {
      final CoursesVideoEntiti result =
          await coursesVideoDatasource.getCourseVideo();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
