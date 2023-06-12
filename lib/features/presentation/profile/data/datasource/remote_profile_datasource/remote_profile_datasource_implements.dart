import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grow_food/core/constants/back_constants.dart';
import 'package:grow_food/core/constants/constants.dart';
import 'package:grow_food/core/helpers/auth_interceptor/auth_interceptor.dart';
import 'package:grow_food/features/presentation/profile/data/datasource/remote_profile_datasource/remote_profile_datasource.dart';
import 'package:grow_food/features/presentation/profile/data/models/invite_link_model.dart';
import 'package:grow_food/features/presentation/profile/data/models/profile_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RemoteProfileDatasourceImpl implements RemoteProfileDatasource {
  Dio _dio = Dio();
   final storage = const FlutterSecureStorage();
  RemoteProfileDatasourceImpl() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );
    initializeInterceptor();
  }

  initializeInterceptor() {
    _dio.interceptors.add(DataSourceInterceptor());
    if (kDebugMode) {
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
  }

  Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final Response response = await _dio.get(Endpoints.profile.endpoint);
      if (response.statusCode! >= 200 && response.statusCode! < 400) {
        return ProfileModel.fromJson(response.data);
      } else {
        throw response.data['error'];
      }
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw 'Вы ввели данные не правильно';
      } else if (error.response!.statusCode! >= 500) {
        throw 'Ошибка сервера';
      } else {
        throw 'Что-то пошло не так!';
      }
    }
  }

  @override
  Future<InviteLinkModel> getRef() async {
    try {
      final Response response = await _dio.post(Endpoints.inviteLink.endpoint);
      if (response.statusCode! >= 200 && response.statusCode! < 400) {
        return InviteLinkModel.fromJson(response.data);
      } else {
        throw response.data['error'];
      }
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw 'Вы ввели данные не правильно';
      } else if (error.response!.statusCode! >= 500) {
        throw 'Ошибка сервера';
      } else {
        throw 'Что-то пошло не так!';
      }
    }
  }

  @override
  Future<ProfileModel> editAvatar({required String avatar}) async {
    final userData = jsonEncode({
      "avatar": avatar,
    });
    try {
      final Response response = await _dio.patch(
        Endpoints.profile.endpoint,
        data: userData,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 400) {
        return ProfileModel.fromJson(response.data);
      } else {
        throw response.data['error'];
      }
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw 'Вы ввели данные не правильно';
      } else if (error.response!.statusCode! >= 500) {
        throw 'Ошибка сервера';
      } else {
        throw 'Что-то пошло не так!';
      }
    }
  }

  @override
  Future<ProfileModel> editEmail({required String email}) async {
    final userData = jsonEncode({
      "email": email,
    });
    try {
      final Response response = await _dio.patch(
        Endpoints.profile.endpoint,
        data: userData,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 400) {
        return ProfileModel.fromJson(response.data);
      } else {
        throw response.data['error'];
      }
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw 'Вы ввели Email не корректоно';
      } else if (error.response!.statusCode! >= 500) {
        throw 'Ошибка сервера';
      } else {
        throw 'Что-то пошло не так!';
      }
    }
  }

  @override
  Future<ProfileModel> editName({required String name}) async {
    final userData = jsonEncode({
      "name": name,
    });
    try {
      final Response response = await _dio.patch(
        Endpoints.profile.endpoint,
        data: userData,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 400) {
        return ProfileModel.fromJson(response.data);
      } else {
        throw response.data['error'];
      }
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw 'Вы ввели Имя не корректно';
      } else if (error.response!.statusCode! >= 500) {
        throw 'Ошибка сервера';
      } else {
        throw 'Что-то пошло не так!';
      }
    }
  }

  @override
  Future<ProfileModel> editNumber({required String number}) async {
    final userData = jsonEncode({
      "phone": number,
    });
    try {
      final Response response = await _dio.patch(
        Endpoints.profile.endpoint,
        data: userData,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 400) {
        return ProfileModel.fromJson(response.data);
      } else {
        throw response.data['error'];
      }
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw 'Вы ввели Номер не правильно';
      } else if (error.response!.statusCode! >= 500) {
        throw 'Ошибка сервера';
      } else {
        throw 'Что-то пошло не так!';
      }
    }
  }
  
  @override
  Future<void> deleteAccount() async {
    try {
      final Response response = await _dio.post(Endpoints.deleteAccount.endpoint);
      await storage.delete(key: BackConstants.savedUSerToken);
      return;
    }on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw 'Данные не верны';
      } else if (error.response!.statusCode! >= 500) {
        throw 'Ошибка сервера';
      } else {
        throw 'Что-то пошло не так!';
      }
    }
  }
}
