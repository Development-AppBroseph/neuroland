import 'package:grow_food/features/presentation/auth/domain/entiti/user_sign_up_entiti.dart';

class UserSignUpModel extends UserSignUpEntiti {
  UserSignUpModel({
    required final String email,
    required final String phoneNumber,
    required final int id,
    required final String userName,
  }) : super(
          email: email,
          phoneNumber: phoneNumber,
          id: id,
          userName: userName,
        );
  factory UserSignUpModel.fromJson(Map<String, dynamic> json) =>
      UserSignUpModel(
        email: json['email'],
        phoneNumber: json['phone_number'],
        id: json['id'],
        userName: json['username'],
      );
  Map<String, dynamic> toJson() => {
        'email': email,
        'phone_number': phoneNumber,
        'id': id,
        'username': userName,
      };
}
