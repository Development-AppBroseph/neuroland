import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/partner_coupons/video_coupon_partner_entiti.dart';

class VideoCouponPartnerModel extends VideoCouponPartnerEntiti {
  VideoCouponPartnerModel({
    required final int id,
    required final String promoUrl,
    required final int points,
    required final String partnerPreview,
  }) : super(
          id: id,
          promoUrl: promoUrl,
          points: points,
          partnerPreview: partnerPreview,
        );
  factory VideoCouponPartnerModel.fromJson(Map<String, dynamic> json) =>
      VideoCouponPartnerModel(
        id: json["id"],
        promoUrl: json["promo_url"],
        points: json["points"],
        partnerPreview: json["partner_preview"],
      );
}
