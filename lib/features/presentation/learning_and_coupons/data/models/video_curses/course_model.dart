import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/video_curses/course_entiti.dart';

class CourseModel extends CourseEntiti {
  CourseModel({
    required final int id,
    required final String title,
    required final String description,
    required final DateTime createdAt,
    required final int direction,
  }) : super(
          id: id,
          title: title,
          description: description,
          createdAt: createdAt,
          direction: direction,
        );
  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        direction: json["direction"],
      );
}
