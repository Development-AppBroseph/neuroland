import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_food/features/presentation/program/domain/usecase/get_courses_video.dart';
import 'package:grow_food/features/presentation/program/presentation/controller/actual_courses_state.dart';

class ActualCoursesCubit extends Cubit<ActualCoursesState> {
  final GetCoursesVideo getCoursesVideo;
  ActualCoursesCubit({required this.getCoursesVideo})
      : super(ActualCoursesInitialState());

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
}
