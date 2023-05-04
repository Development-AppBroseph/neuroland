import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/coupons/coupon_entiti.dart';

class CouponModel extends CouponEntiti {
  CouponModel({
    required final int id,
    required final bool canRedeem,
    required final String image,
    required final String description,
    required final int pointsRequired,
    required final int quantity,
    required final String? partner,
  }) : super(
          id: id,
          canRedeem: canRedeem,
          image: image,
          description: description,
          pointsRequired: pointsRequired,
          quantity: quantity,
          partner: partner,
        );
  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
        id: json["id"],
        canRedeem: json["can_redeem"],
        image: json["image"],
        description: json["description"],
        pointsRequired: json["points_required"],
        quantity: json["quantity"],
        partner: json["partner"] ?? null,
      );
}
