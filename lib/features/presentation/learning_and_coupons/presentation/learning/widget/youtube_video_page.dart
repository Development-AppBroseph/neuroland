import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/constants/constants.dart';
import 'package:grow_food/core/helpers/functions/functions.dart';
import 'package:grow_food/core/helpers/widgets/custom_button.dart';
import 'package:grow_food/core/helpers/widgets/custom_text.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/video_curses/direction_entiti.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/video_curses/video_entiti.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  final VideoEntiti videoEntiti;
  final DirectionEntiti directionEntiti;
  final Function() onWatched;
  const VideoPage({super.key, required this.videoEntiti, required this.directionEntiti, required this.onWatched});

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
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoEntiti.videoUrl) ?? '',
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
        final dur = formatTime(youtubePlayerController.value.position.inSeconds);
        if (!widget.videoEntiti.viewed) {
          if (widget.videoEntiti.duration == dur) {
            widget.onWatched();
            youtubePlayerController.dispose();
          }
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
              title: 'Урок',
              fontSize: 18.h,
              fontWeight: FontWeight.w700,
              color: ColorsStyles.whiteColor,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                player,
                SizedBox(height: 20.h),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      title: widget.videoEntiti.course?.title ?? '',
                      fontSize: 22.h,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomText(
                    title: widget.videoEntiti.description,
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
                        title: 'Длительность урока: ',
                        fontSize: 18.h,
                        fontWeight: FontWeight.w700,
                        color: ColorsStyles.blackColor,
                      ),
                      CustomText(
                        title: widget.videoEntiti.duration,
                        fontSize: 18.h,
                        fontWeight: FontWeight.w700,
                        color: ColorsStyles.blackColor,
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
                        title: 'Баллы за просмотр: ',
                        fontSize: 18.h,
                        fontWeight: FontWeight.w700,
                        color: ColorsStyles.blackColor,
                      ),
                      CustomText(
                        title: widget.videoEntiti.points.toString(),
                        fontSize: 18.h,
                        fontWeight: FontWeight.w700,
                        color: ColorsStyles.blackColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomText(
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
                    title: widget.directionEntiti.aboutDirection,
                    fontSize: 18.h,
                    fontWeight: FontWeight.w700,
                    color: ColorsStyles.blackColor,
                  ),
                ),
                SizedBox(height: 25.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomButton(
                    onTap: () async => {
                      if (!await launchUrl(
                        Uri.parse(telegramBot),
                        mode: LaunchMode.externalApplication,
                      ))
                        {
                          throw 'Could not launch $telegramBot',
                        }
                    },
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
