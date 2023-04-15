import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/coupons/coupon_entiti.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/video_curses/direction_entiti.dart';

import 'video_entiti.dart';

class CoursesVideoEntiti {
  CoursesVideoEntiti({
    required this.directions,
    required this.videos,
    required this.coupons,
  });

  final List<DirectionEntiti> directions;
  final List<VideoEntiti> videos;
  final List<CouponEntiti> coupons;
}
