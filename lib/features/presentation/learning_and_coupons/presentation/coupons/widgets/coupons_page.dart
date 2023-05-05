import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_food/core/constants/colors.dart';
import 'package:grow_food/core/helpers/widgets/custom_text.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/partner_coupons/partner_coupon_entiti.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CouponsPage extends StatefulWidget {
  final PartnerCouponEntiti partnerCouponEntiti;
  const CouponsPage({super.key, required this.partnerCouponEntiti});

  @override
  State<CouponsPage> createState() => _CouponsPageState();
}

class _CouponsPageState extends State<CouponsPage> {
  late YoutubePlayerController youtubePlayerController;

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
      initialVideoId: YoutubePlayer.convertUrlToId(
              widget.partnerCouponEntiti.videoCouponePartner.promoUrl) ??
          '',
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
        // final dur =
        //     formatTime(youtubePlayerController.value.position.inSeconds);
        // if (!widget.videoEntiti.viewed) {
        //   if (widget.videoEntiti.duration == dur) {
        //     widget.onWatched();
        //     youtubePlayerController.dispose();
        //   }
        // }
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
              title: 'Купон',
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
                      title: widget.partnerCouponEntiti.description,
                      fontSize: 22.h,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                // SizedBox(height: 15.h),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 24.w),
                //   child: CustomText(
                //     title: widget.partnerCouponEntiti.videoCoupone,
                //     fontSize: 18.h,
                //     fontWeight: FontWeight.w700,
                //     color: ColorsStyles.textFiledHintColor.withOpacity(0.5),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
