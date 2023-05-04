import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/usecase/get_partners_coupons.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/presentation/coupons/controller/partner_coupons_state.dart';

class PartnerCouponsCubit extends Cubit<PartnerCouposState> {
  final GetPartnersCoupons getPartnersCoupons;
  PartnerCouponsCubit({
    required this.getPartnersCoupons,
  }) : super(PartnerCouposEmptyState());

  Future<void> fetchPartnerCoupons() async {
    try {
      emit(PartnerCouposLoadigState());
      final data = await getPartnersCoupons.call(GetPartnersCouponsParams());
      data.fold(
        (error) => emit(PartnerCouposErrorState(error: error.toString())),
        (result) => emit(
          PartnerCouposLoadedState(partnerCouponsEntiti: result),
        ),
      );
    } catch (e) {
      emit(PartnerCouposErrorState(error: e.toString()));
    }
  }
}
