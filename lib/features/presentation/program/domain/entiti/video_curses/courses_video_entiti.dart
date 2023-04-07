import 'package:grow_food/features/presentation/program/domain/entiti/video_curses/direction_entiti.dart';

import 'video_entiti.dart';

class CoursesVideoEntiti {
  CoursesVideoEntiti({
    required this.directions,
    required this.videos,
  });

  final List<DirectionEntiti> directions;
  final List<VideoEntiti> videos;
}
