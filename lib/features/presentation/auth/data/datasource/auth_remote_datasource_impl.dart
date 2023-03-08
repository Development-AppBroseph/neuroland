import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grow_food/core/constants/constants.dart';
import 'package:grow_food/core/error/exception.dart';
import 'package:grow_food/features/presentation/auth/data/datasource/auth_remote_datasorce.dart';
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
  }) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    final userData = jsonEncode({
      "phone_number": phoneNumber,
      "username": userName,
      "password": password,
      "email": email,
    });
    final Response response = await _dio.post(
      Endpoints.users.endpoint,
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
      throw ServerException();
    }
  }
}
