import 'package:dartz/dartz.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/features/presentation/program/domain/entiti/video_curses/courses_video_entiti.dart';

abstract class CoursesVideoRepository {
  Future<Either<Failure, CoursesVideoEntiti>> getCoursesVideo();
}
