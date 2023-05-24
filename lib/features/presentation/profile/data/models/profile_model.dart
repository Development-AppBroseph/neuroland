import 'package:grow_food/features/presentation/profile/data/models/coupon_model.dart';
import 'package:grow_food/features/presentation/profile/data/models/user_model.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/profile_entiti.dart';

class ProfileModel extends ProfileEntiti {
  ProfileModel({required super.user, required super.coupons});
  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        user: UserModel.fromJson(json["user"]),
        coupons: List<CouponModel>.from(
            json["coupons"].map((x) => CouponModel.fromJson(x))),
      );
}
