import 'package:dio/dio.dart';
import 'package:grow_food/features/presentation/auth/data/models/user_sign_in_model.dart';
import 'package:grow_food/features/presentation/auth/data/models/user_sign_up_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserSignUpModel> signUpUser({
    required String userName,
    required String phoneNumber,
    required String email,
    required String password,
    required int id,
  });
  Future<UserSignInModel> signInUser({
    required String emailOrPhoneNumber,
    required String password,
  });

  Future<UserSignInModel> refreshToken();
  Future<dynamic>fetch(RequestOptions options);
}
