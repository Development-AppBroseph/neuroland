import 'package:grow_food/features/presentation/auth/domain/entiti/user_sign_in_entiti.dart';

class UserSignInModel extends UserSignInEntiti {
  UserSignInModel({
    required final String authToken,
  }) : super(
          authToken: authToken,
        );

  factory UserSignInModel.fromJson(Map<String, dynamic> json) =>
      UserSignInModel(
        authToken: json['auth_token'] ?? '',
      );
  Map<String, dynamic> toJson() => {
        'auth_token': authToken,
      };
}
