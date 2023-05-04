import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/widgets/custom_text.dart';
import 'package:grow_food/core/helpers/widgets/my_behavior.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/presentation/coupons/controller/partner_coupons_cubit.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/presentation/coupons/controller/partner_coupons_state.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/presentation/coupons/widgets/coupons_card.dart';

class CouponsView extends StatefulWidget {
  const CouponsView({super.key});

  @override
  State<CouponsView> createState() => _CouponsViewState();
}

class _CouponsViewState extends State<CouponsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsStyles.backgroundColor,
      body: BlocBuilder<PartnerCouponsCubit, PartnerCouposState>(
        builder: (context, state) {
          if (state is PartnerCouposEmptyState) {
            context.read<PartnerCouponsCubit>().fetchPartnerCoupons();
          } else if (state is PartnerCouposLoadedState) {
            return NestedScrollView(
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    elevation: 0,
                    floating: true,
                    pinned: true,
                    expandedHeight: 90,
                    backgroundColor: ColorsStyles.backgroundColor,
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(60),
                      child: SafeArea(
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 24, left: 24, bottom: 15),
                          child: Row(
                            children: [
                              const CustomText(
                                title: 'Купоны',
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                              const Spacer(),
                              Container(
                                height: 33.h,
                                width: 122.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  border: Border.all(
                                      color: ColorsStyles.buttonColor,
                                      width: 2),
                                ),
                                child: CustomText(
                                  title:
                                      'Баллы: ${state.partnerCouponsEntiti.balance}',
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w800,
                                  color: ColorsStyles.buttonColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 18,
                  ),
                  padding: const EdgeInsets.only(top: 15),
                  itemCount:
                      state.partnerCouponsEntiti.partnerCouponEntiti.length,
                  itemBuilder: (context, index) => CouponsCard(
                    couponEntiti:
                        state.partnerCouponsEntiti.partnerCouponEntiti[index],
                  ),
                ),
              ),
            );
          } else if (state is PartnerCouposErrorState) {
            return const Center(
              child: Text('Error'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsStyles.buttonColor,
            ),
          );
        },
      ),
    );
  }
}
