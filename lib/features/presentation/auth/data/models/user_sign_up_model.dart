import 'package:grow_food/features/presentation/auth/domain/entiti/user_sign_up_entiti.dart';

class UserSignUpModel extends UserSignUpEntiti {
  UserSignUpModel({
    required final String email,
    required final String phoneNumber,
    required final int id,
    required final String userName,
    required final String authToken,
    required final String? city,
  }) : super(
          email: email,
          phoneNumber: phoneNumber,
          id: id,
          userName: userName,
          authToken: authToken,
          city: city
        );
  factory UserSignUpModel.fromJson(Map<String, dynamic> json) =>
      UserSignUpModel(
        email: json['email'],
        phoneNumber: json['phone'],
        id: json['id'],
        userName: json['name'],
        authToken: json['auth_token'],
        city: json['city'] ?? null,
      );
  Map<String, dynamic> toJson() => {
        'email': email,
        'phone': phoneNumber,
        'id': id,
        'name': userName,
        'auth_token': authToken,
      };
}
