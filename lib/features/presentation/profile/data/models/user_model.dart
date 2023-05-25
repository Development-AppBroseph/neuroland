import 'package:grow_food/features/presentation/profile/domain/entiti/user_entiti.dart';

class UserModel extends UserEntiti {
  UserModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.email,
    required super.avatar,
    required super.city,
    required super.cityName,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        avatar: json["avatar"],
        city: json["city"],
        cityName: json["city_name"],
      );
}
