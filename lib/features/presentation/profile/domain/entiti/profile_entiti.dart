import 'package:grow_food/features/presentation/profile/domain/entiti/coupon_entiti.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/user_entiti.dart';

class ProfileEntiti {
  final UserEntiti user;
  final List<CouponEntiti> coupons;

  ProfileEntiti({
    required this.user,
    required this.coupons,
  });
}
