import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grow_food/core/constants/constants.dart';
import 'package:grow_food/core/helpers/auth_interceptor/auth_interceptor.dart';
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
    _dio.interceptors.add(DataSourceInterceptor());
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

  Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };
  @override
  Future<UserSignUpModel> signUpUser({
    required String userName,
    required String phoneNumber,
    required String email,
    required String password,
    required int id,
  }) async {
    final userData = jsonEncode({
      "name": userName,
      "email": email,
      "phone": phoneNumber,
      "password": password,
    });

    try {
      final Response response = await _dio.post(
        Endpoints.registration.endpoint,
        data: userData,
        options: Options(
          followRedirects: true,
          headers: headers,
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 400) {
        return UserSignUpModel.fromJson(response.data);
      } else {
        throw response.data['error'];
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        throw e.response?.data['error'];
      } else if (e.response!.statusCode! >= 500) {
        throw 'Ошибка сервера';
      } else {
        throw 'Что-то пошло не так!';
      }
    }
  }

  @override
  Future<UserSignInModel> signInUser(
      {required String emailOrPhoneNumber, required String password}) async {
    final userData = jsonEncode({
      "password": password,
      "email": emailOrPhoneNumber,
    });
    try {
      final Response response = await _dio.post(
        Endpoints.authentication.endpoint,
        data: userData,
        options: Options(followRedirects: true, headers: headers),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 400) {
        return UserSignInModel.fromJson(response.data);
      } else {
        throw response.data['error'];
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        throw 'Такого пользователя нет';
      } else if (e.response!.statusCode! >= 500) {
        throw 'Ошибка сервера';
      } else {
        throw 'Что-то пошло не так!';
      }
    }
  }

  @override
  Future<UserSignInModel> refreshToken() async {
    try {
      final response = await _dio.post(
        Endpoints.refreshToken.endpoint,
        options: Options(followRedirects: true, headers: headers),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 400) {
        return UserSignInModel.fromJson(response.data);
      } else {
        throw response.data['error'];
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        throw 'Такого пользователя нет';
      } else if (e.response!.statusCode! >= 500) {
        throw 'Ошибка сервера';
      } else {
        throw 'Что-то пошло не так!';
      }
    }
  }

  @override
  Future fetch(RequestOptions options) {
    try {
      return _dio.fetch(options);
    } catch (_) {
      rethrow;
    }
  }
}
