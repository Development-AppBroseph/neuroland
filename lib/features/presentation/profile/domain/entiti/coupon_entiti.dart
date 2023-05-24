class CouponEntiti {
  final int id;
  final String image;
  final String description;
  final int pointsRequired;
  final int quantity;
  final bool canRedeem;
  final dynamic videoCoupone;
  final dynamic videoCouponePartner;

  CouponEntiti({
    required this.id,
    required this.image,
    required this.description,
    required this.pointsRequired,
    required this.quantity,
    required this.canRedeem,
    required this.videoCoupone,
    required this.videoCouponePartner,
  });
}
