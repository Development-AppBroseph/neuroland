import 'package:grow_food/features/presentation/program/domain/entiti/video_curses/direction_entiti.dart';

class DirectionModel extends DirectionEntiti {
  DirectionModel({
    required final int id,
    required final String name,
  }) : super(
          id: id,
          name: name,
        );
  factory DirectionModel.fromJson(Map<String, dynamic> json) => DirectionModel(
        id: json["id"],
        name: json["name"],
      );
}
