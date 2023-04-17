import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/video_curses/direction_entiti.dart';

class DirectionModel extends DirectionEntiti {
  DirectionModel({
    required final int id,
    required final String name,
    required final String aboutDirection,
  }) : super(
          id: id,
          name: name,
          aboutDirection: aboutDirection,
        );
  factory DirectionModel.fromJson(Map<String, dynamic> json) => DirectionModel(
        id: json["id"],
        name: json["name"],
        aboutDirection: json['about_direction'],
      );
}
