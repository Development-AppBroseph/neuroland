import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/widgets/custom_text.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/video_curses/direction_entiti.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/video_curses/video_entiti.dart';

import '../controller/actual_courses_cubit.dart';
import '../controller/actual_courses_state.dart';
import 'youtube_video_page.dart';

class CoursesCard extends StatefulWidget {
  final VideoEntiti videoEntiti;
  final DirectionEntiti directionEntiti;
  const CoursesCard({
    super.key,
    required this.videoEntiti,
    required this.directionEntiti,
  });

  @override
  State<CoursesCard> createState() => _CoursesCardState();
}

class _CoursesCardState extends State<CoursesCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActualCoursesCubit, ActualCoursesState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoPage(
                  videoEntiti: widget.videoEntiti,
                  directionEntiti: widget.directionEntiti,
                  onWatched: () => context
                      .read<ActualCoursesCubit>()
                      .addPointsToUser(widget.videoEntiti.id),
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
                  color: const Color.fromRGBO(0, 0, 0, 0.05),
                  spreadRadius: 0,
                  blurRadius: 20.r,
                  offset: const Offset(0, 0),
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
                        imageUrl: widget.videoEntiti.preview,
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
                          Padding(
                            padding: EdgeInsets.only(right: 50.w),
                            child: CustomText(
                              title: widget.videoEntiti.course!.description,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800,
                              color: ColorsStyles.blackColor,
                            ),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: ColorsStyles.gradientBlueColor,
                      ),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
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
      },
    );
  }
}
