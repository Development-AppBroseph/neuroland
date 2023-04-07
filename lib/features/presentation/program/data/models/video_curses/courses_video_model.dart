import 'package:grow_food/features/presentation/program/data/models/video_curses/direction_model.dart';
import 'package:grow_food/features/presentation/program/data/models/video_curses/video_model.dart';
import 'package:grow_food/features/presentation/program/domain/entiti/video_curses/courses_video_entiti.dart';
import 'package:grow_food/features/presentation/program/domain/entiti/video_curses/direction_entiti.dart';
import 'package:grow_food/features/presentation/program/domain/entiti/video_curses/video_entiti.dart';

class CourseVideoModel extends CoursesVideoEntiti {
  CourseVideoModel({
    required final List<DirectionEntiti> directions,
    required final List<VideoEntiti> videos,
  }) : super(
          directions: directions,
          videos: videos,
        );
  factory CourseVideoModel.fromJson(Map<String, dynamic> json) =>
      CourseVideoModel(
        directions: List<DirectionModel>.from(
          json["directions"].map((x) => DirectionModel.fromJson(x)),
        ),
        videos: List<VideoModel>.from(
          json["videos"].map((x) => VideoModel.fromJson(x)),
        ),
      );
}
