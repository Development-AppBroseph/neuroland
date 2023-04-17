import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/widgets/custom_button.dart';
import 'package:grow_food/core/helpers/widgets/custom_text.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/video_curses/video_entiti.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  final VideoEntiti videoEntiti;
  const VideoPage({super.key, required this.videoEntiti});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late YoutubePlayerController youtubePlayerController;
  late PlayerState playerState;
  @override
  void dispose() {
    super.dispose();
    youtubePlayerController.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
    youtubePlayerController.pause();
  }

  @override
  void initState() {
    super.initState();
    youtubePlayerController = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(widget.videoEntiti.videoUrl) ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    )..addListener(() {
        if (!youtubePlayerController.value.isFullScreen) {
          SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.manual,
            overlays: [
              SystemUiOverlay.bottom,
              SystemUiOverlay.top,
            ],
          );
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: youtubePlayerController,
        showVideoProgressIndicator: false,
        progressIndicatorColor: Colors.red,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
        ),
      ),
      builder: (context, player) => Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          foregroundColor: Colors.black,
          title: Container(
            width: 100.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            alignment: Alignment.center,
            child: Text(
              'Урок',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.h,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                player,
                SizedBox(height: 20.h),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    // padding:
                    //     EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    // decoration: BoxDecoration(
                    //   color: accentColor,
                    //   borderRadius: BorderRadius.circular(10.r),
                    // ),
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      title: widget.videoEntiti.course?.title ?? '',
                      fontSize: 22.h,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 24.w),
                //   padding:
                //       EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                //   decoration: BoxDecoration(
                //     color: accentColor,
                //     borderRadius: BorderRadius.circular(10.r),
                //   ),
                //   child: CustomText(
                //     // title: widget.description,
                //     title: 'Описание',
                //     fontSize: 18.h,
                //     fontWeight: FontWeight.w700,
                //     color: ColorsStyles.whiteColor,
                //   ),
                // ),
                SizedBox(height: 15.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomText(
                    title: widget.videoEntiti.description,
                    // title:
                    //     'В данном уроке мы расскажем Вам, о том какие времена есть в английском языке. Приятного просмотра!',
                    fontSize: 18.h,
                    fontWeight: FontWeight.w700,
                    color: ColorsStyles.textFiledHintColor.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 40.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      CustomText(
                        // title: widget.description,
                        title: 'Длительность урока: ',
                        fontSize: 18.h,
                        fontWeight: FontWeight.w700,
                        color: ColorsStyles.blackColor,
                      ),
                      CustomText(
                        // title: widget.description,
                        title: widget.videoEntiti.duration,
                        fontSize: 18.h,
                        fontWeight: FontWeight.w700,
                        color: ColorsStyles.textFiledHintColor.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      CustomText(
                        // title: widget.description,
                        title: 'Баллы за просмотр: ',
                        fontSize: 18.h,
                        fontWeight: FontWeight.w700,
                        color: ColorsStyles.blackColor,
                      ),
                      CustomText(
                        // title: widget.description,
                        title: widget.videoEntiti.points.toString(),
                        fontSize: 18.h,
                        fontWeight: FontWeight.w700,
                        color: ColorsStyles.textFiledHintColor.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  // padding:
                  // EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  // decoration: BoxDecoration(
                  //   color: accentColor,
                  //   borderRadius: BorderRadius.circular(10.r),
                  // ),
                  child: CustomText(
                    // title: widget.description,
                    title: 'О направлении: ',
                    fontSize: 18.h,
                    fontWeight: FontWeight.w700,
                    color: ColorsStyles.blackColor,
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomText(
                    title: widget.videoEntiti.course?.aboutDirection ?? '',
                    fontSize: 18.h,
                    fontWeight: FontWeight.w700,
                    color: ColorsStyles.textFiledHintColor.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 25.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: const CustomButton(
                    title: 'Записаться на пробное занятие',
                    accentText: true,
                    withPadding: false,
                  ),
                ),
                SizedBox(height: 300.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
