class CouponEntiti {
  final int id;
  final bool canRedeem;
  final String image;
  final String description;
  final int pointsRequired;
  final int quantity;
  final String? partner;

  CouponEntiti({
    required this.id,
    required this.canRedeem,
    required this.image,
    required this.description,
    required this.pointsRequired,
    required this.quantity,
    this.partner,
  });
}
