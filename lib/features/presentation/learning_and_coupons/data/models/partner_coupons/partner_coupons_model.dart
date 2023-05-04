import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/partner_coupons/partner_coupons_entiti.dart';

import 'partner_coupon_model.dart';

class PartnerCouponsModel extends PartnerCouponsEntiti {
  PartnerCouponsModel({
    required final int balance,
    required final List<PartnerCouponModel> partnerCouponModel,
  }) : super(
          balance: balance,
          partnerCouponEntiti: partnerCouponModel,
        );
  factory PartnerCouponsModel.fromJson(Map<String, dynamic> json) =>
      PartnerCouponsModel(
        balance: json['balance'],
        partnerCouponModel: List<PartnerCouponModel>.from(
          (json['coupons'] as List<dynamic>)
              .map((data) => PartnerCouponModel.fromJson(data))
              .toList(),
        ),
      );
}
