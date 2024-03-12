import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/widgets/custom_text.dart';
import 'package:grow_food/core/helpers/widgets/my_behavior.dart';
import 'package:grow_food/features/presentation/profile/domain/entiti/coupon_entiti.dart';

class BoughtCouponsPage extends StatefulWidget {
  final List<CouponEntiti> coupons;
  const BoughtCouponsPage({super.key, required this.coupons});

  @override
  State<BoughtCouponsPage> createState() => _BoughtCouponsPageState();
}

class _BoughtCouponsPageState extends State<BoughtCouponsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Container(
          width: 100.w,
          height: 30.h,
          decoration: BoxDecoration(
            color: accentColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          alignment: Alignment.center,
          child: CustomText(
            title: 'Купоны',
            fontSize: 18.h,
            fontWeight: FontWeight.w700,
            color: ColorsStyles.whiteColor,
          ),
        ),
      ),
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 18,
            ),
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            itemCount: widget.coupons.length,
            itemBuilder: (context, index) => Container(
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
                          imageUrl: widget.coupons[index].image,
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
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.6),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: CustomText(
                                title:
                                    '${widget.coupons[index].pointsRequired} баллов',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
