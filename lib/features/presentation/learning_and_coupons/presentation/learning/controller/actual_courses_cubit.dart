import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:grow_food/core/helpers/functions/functions.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/usecase/add_points.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/usecase/get_courses_video.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/usecase/get_partners_coupons.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/usecase/use_coupon.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/presentation/learning/controller/actual_courses_state.dart';

class ActualCoursesCubit extends Cubit<ActualCoursesState> {
  final GetCoursesVideo getCoursesVideo;
  final AddPoints addPoints;
  final UseCoupon useCoupon;
  final GetPartnersCoupons getPartnersCoupons;
  ActualCoursesCubit({
    required this.getCoursesVideo,
    required this.addPoints,
    required this.useCoupon,
    required this.getPartnersCoupons,
  }) : super(ActualCoursesInitialState());

  Future<void> fetchCoursesVideo() async {
    try {
      emit(ActualCoursesLoadingState());
      final courses = await getCoursesVideo.call(CoursesVideoParams());
      courses.fold(
        (error) => emit(ActualCoursesErrorState(message: error.toString())),
        (data) => emit(ActualCoursesLoadedState(coursesVideoEntiti: data)),
      );
    } catch (e) {
      emit(ActualCoursesErrorState(message: e.toString()));
    }
  }

  Future<void> addPointsToUser(int videoId) async {
    try {
      SmartDialogFunctions.showCustomLoader();
      final result = await addPoints.call(AddPointParams(videoId: videoId));
      result.fold(
        (error) => {
          SmartDialog.dismiss(),
          SmartDialogFunctions.showErrorDilog(title: error.error),
        },
        (data) => {
          SmartDialog.dismiss(),
          SmartDialogFunctions.showErrorDilog(title: 'Баллы зачислены'),
        },
      );
      final courses = await getCoursesVideo.call(CoursesVideoParams());
      courses.fold(
        (error) => emit(ActualCoursesErrorState(message: error.toString())),
        (data) => emit(ActualCoursesLoadedState(coursesVideoEntiti: data)),
      );
    } catch (e) {
      SmartDialog.dismiss();
      SmartDialogFunctions.showErrorDilog(title: e.toString());
    }
  }

  Future<void> useUserCoupon(int couponId) async {
    try {
      SmartDialogFunctions.showCustomLoader();
      final result = await useCoupon.call(UseCouponParams(couponId: couponId));
      result.fold(
        (error) => {
          SmartDialog.dismiss(),
          SmartDialogFunctions.showErrorDilog(title: error.error),
        },
        (data) => {
          SmartDialog.dismiss(),
          SmartDialogFunctions.showErrorDilog(title: 'Купон приобретен'),
        },
      );
      final courses = await getCoursesVideo.call(CoursesVideoParams());
      courses.fold(
        (error) => emit(ActualCoursesErrorState(message: error.toString())),
        (data) => emit(ActualCoursesLoadedState(coursesVideoEntiti: data)),
      );
    } catch (e) {
      SmartDialog.dismiss();
      SmartDialogFunctions.showErrorDilog(title: e.toString());
    }
  }
}
