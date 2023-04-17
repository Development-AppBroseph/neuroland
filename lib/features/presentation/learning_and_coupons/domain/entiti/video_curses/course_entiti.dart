class CourseEntiti {
  CourseEntiti({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.aboutDirection,
    required this.direction,
  });

  final int id;
  final String title;
  final String description;
  final String aboutDirection;
  final DateTime createdAt;
  final int direction;
}
