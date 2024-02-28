import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/widgets/custom_text.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/partner_coupons/partner_coupon_entiti.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/presentation/coupons/controller/partner_coupons_cubit.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/presentation/learning/controller/actual_courses_state.dart';

import '../../learning/controller/actual_courses_cubit.dart';
import 'coupons_page.dart';

class CouponsCard extends StatefulWidget {
  final PartnerCouponEntiti couponEntiti;
  const CouponsCard({super.key, required this.couponEntiti});

  @override
  State<CouponsCard> createState() => _CouponsCardState();
}

class _CouponsCardState extends State<CouponsCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActualCoursesCubit, ActualCoursesState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CouponsPage(
                partnerCouponEntiti: widget.couponEntiti,
              ),
            ),
          ),
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            decoration: BoxDecoration(
              color: ColorsStyles.whiteColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: CachedNetworkImage(
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            child: CircularProgressIndicator(
                              color: ColorsStyles.buttonColor,
                              value: downloadProgress.progress,
                            ),
                          ),
                        ),
                        height: 110,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: widget.couponEntiti.image,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 30.w,
                        top: 14.h,
                        right: 30.w,
                        bottom: 20,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Spacer(),
                          GestureDetector(
                            onTap: () async => {
                              await context
                                  .read<ActualCoursesCubit>()
                                  .useUserCoupon(widget.couponEntiti.id),
                              context
                                  .read<PartnerCouponsCubit>()
                                  .fetchPartnerCoupons(),
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: ColorsStyles.gradientBlueColor,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: CustomText(
                                title:
                                    '${widget.couponEntiti.pointsRequired} баллов',
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w800,
                                color: ColorsStyles.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(
                    left: 30.w,
                    top: 14.h,
                    right: 30.w,
                    bottom: 20,
                  ),
                  child:
                      GestureDetector(
                        onTap: () async => {
                          await context
                              .read<ActualCoursesCubit>()
                              .useUserCoupon(widget.couponEntiti.id),
                          context
                              .read<PartnerCouponsCubit>()
                              .fetchPartnerCoupons(),
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: ColorsStyles.whiteColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: CustomText(
                            title:
                                'Партнер',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w800,
                            color: ColorsStyles.mainTextColor,
                          ),
                        ),
                  ),
                ),
                // Positioned(
                //   top: 22,
                //   left: 30,
                //   child: Container(
                //     padding:
                //         EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                //     decoration: BoxDecoration(
                //       color: ColorsStyles.whiteColor,
                //       borderRadius: BorderRadius.circular(10.r),
                //     ),
                //     child: CustomText(
                //       title: widget.couponEntiti.partnerName!,
                //       fontSize: 15.sp,
                //       fontWeight: FontWeight.w800,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
