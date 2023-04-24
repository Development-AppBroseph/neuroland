import 'package:grow_food/features/presentation/learning_and_coupons/data/models/coupons/coupon_model.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/data/models/video_curses/direction_model.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/data/models/video_curses/video_model.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/coupons/coupon_entiti.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/video_curses/courses_video_entiti.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/video_curses/direction_entiti.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/video_curses/video_entiti.dart';

class CourseVideoModel extends CoursesVideoEntiti {
  CourseVideoModel({
    required final List<DirectionEntiti> directions,
    required final List<VideoEntiti> videos,
    required final List<CouponEntiti> coupons,
    required final int balance,
  }) : super(
          directions: directions,
          videos: videos,
          coupons: coupons,
          balance: balance,
        );
  factory CourseVideoModel.fromJson(Map<String, dynamic> json) =>
      CourseVideoModel(
        directions: List<DirectionModel>.from(
          json["directions"].map((x) => DirectionModel.fromJson(x)),
        ),
        videos: List<VideoModel>.from(
          json["videos"].map((x) => VideoModel.fromJson(x)),
        ),
        coupons: List<CouponEntiti>.from(
          json['coupons'].map((x) => CouponModel.fromJson(x)),
        ),
        balance: json['balance'] as int,
      );
}
