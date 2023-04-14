import 'package:grow_food/features/presentation/learning_and_coupons/data/models/video_curses/course_model.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/video_curses/course_entiti.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/video_curses/video_entiti.dart';

class VideoModel extends VideoEntiti {
  VideoModel({
    required final int id,
    required final CourseEntiti? course,
    required final int points,
    required final String preview,
    required final String duration,
    required final String videoUrl,
    required final DateTime createdAt,
  }) : super(
          id: id,
          course: course,
          points: points,
          preview: preview,
          duration: duration,
          videoUrl: videoUrl,
          createdAt: createdAt,
        );
  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        id: json["id"],
        course: json['course'] == null
            ? null
            : CourseModel.fromJson(json["course"]),
        points: json["points"],
        preview: json["preview"],
        duration: json["duration"],
        videoUrl: json["video_url"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}
