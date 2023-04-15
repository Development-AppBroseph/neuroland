class CouponEntiti {
  final int id;
  final bool canRedeem;
  final String image;
  final String title;
  final String couponType;
  final String description;
  final String? partnerName;
  final int pointsRequired;
  final int quantity;
  final String? partner;

  CouponEntiti({
    required this.id,
    required this.canRedeem,
    required this.image,
    required this.title,
    required this.couponType,
    required this.description,
    required this.partnerName,
    required this.pointsRequired,
    required this.quantity,
    this.partner,
  });
}
