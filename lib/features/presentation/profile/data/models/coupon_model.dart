import 'package:grow_food/features/presentation/profile/domain/entiti/coupon_entiti.dart';

class CouponModel extends CouponEntiti {
  CouponModel({
    required super.id,
    required super.image,
    required super.description,
    required super.pointsRequired,
    required super.quantity,
    required super.canRedeem,
    required super.videoCoupone,
    required super.videoCouponePartner,
  });
  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
        id: json["id"],
        image: json["image"],
        description: json["description"],
        pointsRequired: json["points_required"],
        quantity: json["quantity"],
        canRedeem: json["can_redeem"],
        videoCoupone: json["video_coupone"],
        videoCouponePartner: json["video_coupone_partner"],
      );
}
