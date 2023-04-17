import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/constants/constants.dart';
import 'package:grow_food/core/helpers/functions/functions.dart';
import 'package:grow_food/core/helpers/widgets/custom_text.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/video_curses/video_entiti.dart';

import 'youtube_video_page.dart';

class CoursesCard extends StatefulWidget {
  final VideoEntiti videoEntiti;
  const CoursesCard({
    super.key,
    required this.videoEntiti,
  });

  @override
  State<CoursesCard> createState() => _CoursesCardState();
}

class _CoursesCardState extends State<CoursesCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPage(
              videoUrl: widget.videoEntiti.videoUrl,
              description: widget.videoEntiti.description,
              titleVideo: widget.videoEntiti.course!.title,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        padding: EdgeInsets.only(
          bottom: 21.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: ColorsStyles.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 10),
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
                        margin: const EdgeInsets.all(50),
                        child: CircularProgressIndicator(
                          color: ColorsStyles.buttonColor,
                          value: downloadProgress.progress,
                        ),
                      ),
                    ),
                    imageUrl: '$baseUrl${widget.videoEntiti.preview}',
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 30.w,
                    top: 16.h,
                    right: 15.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: widget.videoEntiti.course!.title,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomText(
                        title: widget.videoEntiti.course!.description,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 20,
              right: 30,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: ColorsStyles.buttonColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: CustomText(
                  title: '+${widget.videoEntiti.points.toString()} баллов',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w800,
                  color: ColorsStyles.whiteColor,
                ),
              ),
            ),
            Positioned(
              right: 39,
              bottom: 31,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: ColorsStyles.buttonColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  color: ColorsStyles.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
