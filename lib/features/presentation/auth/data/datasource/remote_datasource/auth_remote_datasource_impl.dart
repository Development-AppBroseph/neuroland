import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grow_food/core/constants/constants.dart';
import 'package:grow_food/features/presentation/auth/data/datasource/remote_datasource/auth_remote_datasorce.dart';
import 'package:grow_food/features/presentation/auth/data/models/user_sign_in_model.dart';
import 'package:grow_food/features/presentation/auth/data/models/user_sign_up_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  Dio _dio = Dio();
  final storage = const FlutterSecureStorage();

  AuthRemoteDatasourceImpl() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );
    initializeInterceptor();
  }
  initializeInterceptor() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  @override
  Future<UserSignUpModel> signUpUser({
    required String userName,
    required String phoneNumber,
    required String email,
    required String password,
    required int id,
  }) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    final userData = jsonEncode({
      "name": userName,
      "email": email,
      "phone": phoneNumber,
      "branch_ids": id,
      "password": password,
    });
    final Response response = await _dio.post(
      Endpoints.registration.endpoint,
      data: userData,
      options: Options(
        followRedirects: true,
        headers: headers,
        validateStatus: (status) => status! < 499,
      ),
    );
    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      return UserSignUpModel.fromJson(response.data);
    } else {
      throw response.data['error'];
    }
  }

  @override
  Future<UserSignInModel> signInUser(
      {required String emailOrPhoneNumber, required String password}) async {
    final userData = jsonEncode({
      "password": password,
      "email": emailOrPhoneNumber,
    });
    final Response response = await _dio.post(
      Endpoints.authentication.endpoint,
      data: userData,
      options: Options(
        followRedirects: true,
        validateStatus: (status) => status! < 499,
      ),
    );
    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      return UserSignInModel.fromJson(response.data);
    } else {
      throw response.data['error'];
    }
  }
}
