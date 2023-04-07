import 'course_entiti.dart';

class VideoEntiti {
  VideoEntiti({
    required this.id,
    required this.course,
    required this.points,
    required this.preview,
    required this.duration,
    required this.videoUrl,
    required this.createdAt,
  });

  final int id;
  final CourseEntiti course;
  final int points;
  final String preview;
  final String duration;
  final String videoUrl;
  final DateTime createdAt;
}
