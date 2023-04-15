import 'package:equatable/equatable.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/video_curses/courses_video_entiti.dart';

abstract class ActualCoursesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ActualCoursesInitialState extends ActualCoursesState {
  @override
  List<Object?> get props => [];
}

class ActualCoursesLoadingState extends ActualCoursesState {
  @override
  List<Object?> get props => [];
}

class ActualCoursesLoadedState extends ActualCoursesState {
  final CoursesVideoEntiti coursesVideoEntiti;

  ActualCoursesLoadedState({required this.coursesVideoEntiti});

  @override
  List<Object?> get props => [coursesVideoEntiti];
}

class ActualCoursesErrorState extends ActualCoursesState {
  final String message;

  ActualCoursesErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
