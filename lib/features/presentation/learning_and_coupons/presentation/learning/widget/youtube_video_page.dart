import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/widgets/custom_text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  final String videoUrl;
  final String description;
  final String titleVideo;
  const VideoPage(
      {super.key,
      required this.videoUrl,
      required this.description,
      required this.titleVideo});

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
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '',
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
        backgroundColor: ColorsStyles.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                player,
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomText(
                    title: widget.titleVideo,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomText(
                    title: widget.description,
                    fontSize: 18,
                    color: ColorsStyles.textFiledHintColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
