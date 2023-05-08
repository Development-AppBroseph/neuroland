import 'package:grow_food/features/presentation/learning_and_coupons/data/models/partner_coupons/video_coupon_partner_model.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/partner_coupons/partner_coupon_entiti.dart';

class PartnerCouponModel extends PartnerCouponEntiti {
  PartnerCouponModel({
    required final int id,
    required final String image,
    required final String description,
    required final int pointsRequired,
    required final int quantity,
    required final bool canRedeem,
    required final dynamic videoCoupone,
    required final VideoCouponPartnerModel? videoCouponePartner,
  }) : super(
            id: id,
            image: image,
            description: description,
            pointsRequired: pointsRequired,
            quantity: quantity,
            canRedeem: canRedeem,
            videoCoupone: videoCoupone,
            videoCouponePartner: videoCouponePartner);
  factory PartnerCouponModel.fromJson(Map<String, dynamic> json) =>
      PartnerCouponModel(
        id: json["id"] as int,
        image: json["image"] as String,
        description: json["description"] as String,
        pointsRequired: json["points_required"] as int,
        quantity: json["quantity"] as int,
        canRedeem: json["can_redeem"] as bool,
        videoCoupone: json["video_coupone"] ?? null,
        videoCouponePartner: json['video_coupone_partner'] == null ? null : VideoCouponPartnerModel.fromJson(json["video_coupone_partner"]),
      );
}
