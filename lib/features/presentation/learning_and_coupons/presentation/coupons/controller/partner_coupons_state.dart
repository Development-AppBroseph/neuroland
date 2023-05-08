import 'package:equatable/equatable.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/partner_coupons/partner_coupons_entiti.dart';

abstract class PartnerCouposState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PartnerCouposEmptyState extends PartnerCouposState {
  @override
  List<Object?> get props => [];
}

class PartnerCouposLoadigState extends PartnerCouposState {
  @override
  List<Object?> get props => [];
}

class PartnerCouposLoadedState extends PartnerCouposState {
  final PartnerCouponsEntiti partnerCouponsEntiti;

  PartnerCouposLoadedState({required this.partnerCouponsEntiti});
  @override
  List<Object?> get props => [partnerCouponsEntiti];
}

class PartnerCouposErrorState extends PartnerCouposState {
  final String error;

  PartnerCouposErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}

