import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/partner_coupons/video_coupon_partner_entiti.dart';

class PartnerCouponEntiti {
  final int id;
  final String image;
  final String description;
  final int pointsRequired;
  final int quantity;
  final bool canRedeem;
  final dynamic videoCoupone;
  final VideoCouponPartnerEntiti videoCouponePartner;

  PartnerCouponEntiti({
    required this.id,
    required this.image,
    required this.description,
    required this.pointsRequired,
    required this.quantity,
    required this.canRedeem,
    this.videoCoupone,
    required this.videoCouponePartner,
  });
}
