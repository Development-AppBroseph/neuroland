import 'package:grow_food/features/presentation/profile/domain/entiti/profile_entiti.dart';

class ProfileModel extends ProfileEntiti {
  ProfileModel({
    required final int id,
    required final String name,
    required final String phone,
    required final String email,
  }) : super(
          id: id,
          name: name,
          phone: phone,
          email: email,
        );
  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json['id'] as int,
        name: json['name'] as String,
        phone: json['phone'] as String,
        email: json['email'] as String,
      );
}
