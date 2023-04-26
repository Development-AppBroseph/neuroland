import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/widgets/custom_text.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/coupons/coupon_entiti.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/presentation/learning/controller/actual_courses_state.dart';

import '../../learning/controller/actual_courses_cubit.dart';

class CouponsCard extends StatefulWidget {
  final CouponEntiti couponEntiti;
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
          onTap: () => context
              .read<ActualCoursesCubit>()
              .useUserCoupon(widget.couponEntiti.id),
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
                          CustomText(
                            title: widget.couponEntiti.title,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                          ),
                          const Spacer(),
                          Container(
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
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 22,
                  left: 30,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: ColorsStyles.whiteColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: CustomText(
                      title: widget.couponEntiti.partnerName!,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
