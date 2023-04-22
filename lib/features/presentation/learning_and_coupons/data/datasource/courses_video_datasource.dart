import 'package:dio/dio.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/data/models/video_curses/courses_video_model.dart';

abstract class CoursesVideoDatasource {
  Future<CourseVideoModel> getCourseVideo();
  Future<dynamic> fetch(RequestOptions options);
  Future<void> addPoints(int videoId);
  Future<void> useCoupon(int couponId);
}
