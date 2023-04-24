import 'package:dartz/dartz.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/video_curses/courses_video_entiti.dart';

abstract class CoursesVideoRepository {
  Future<Either<Failure, CoursesVideoEntiti>> getCoursesVideo();
  Future<Either<Failure, void>> addPoints(int videoId);
  Future<Either<Failure, void>> useCoupon(int couponId);
}
