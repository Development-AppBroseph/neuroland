import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:grow_food/core/constants/constants.dart';
import 'package:grow_food/core/helpers/auth_interceptor/auth_interceptor.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/data/datasource/courses_video_datasource.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/data/models/partner_coupons/partner_coupons_model.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/data/models/video_curses/courses_video_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CoursesVideoDatasourceImpl implements CoursesVideoDatasource {
  Dio _dio = Dio();
  CoursesVideoDatasourceImpl() {
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
  Future<CourseVideoModel> getCourseVideo() async {
    final response = await _dio.get(Endpoints.vidoCourses.endpoint,
        options: Options(
          headers: headers,
        ));
    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      return CourseVideoModel.fromJson(response.data);
    } else {
      throw DioErrorType.other;
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

  @override
  Future<void> addPoints(int videoId) async {
    try {
      final Response response = await _dio.post(
        Endpoints.addPoints.endpoint.replaceRange(12, 13, "$videoId/"),
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        return;
      } else {
        throw "Вы не посмотрели видео";
      }
    } on DioError catch (error) {
      if (error.response!.statusCode == 400) {
        throw 'Вы не посмотрели видео';
      } else if (error.response!.statusCode! >= 500) {
        throw 'Ошибка сервера';
      } else {
        throw 'Что-то пошло не так!';
      }
    }
  }

  @override
  Future<void> useCoupon(int couponId) async {
    try {
      final Response response = await _dio.post(
        Endpoints.useCoupon.endpoint.replaceRange(13, 14, '$couponId/'),
        options: Options(headers: headers),
      );
      log(response.statusMessage.toString());
      if (response.statusCode == 200) {
        return;
      } else {
        throw "Вы уже приобрели купон";
      }
    } on DioError catch (error) {
      log(error.response!.data.toString());
      if (error.response!.statusCode == 400) {
        throw 'Вы уже приобрели купон';
      }
       if (error.response!.statusCode == 404) {
        throw 'Больше нет доступных купонов';
      }
      if (error.response!.statusCode == 403) {
        throw 'У Вас недостаточно поитнов, чтобы приобрести купон';
      } else if (error.response!.statusCode! >= 500) {
        throw 'Ошибка сервера';
      } else {
        throw 'Что-то пошло не так!';
      }
    }
  }

  @override
  Future<PartnerCouponsModel> getPartnersCoupons() async {
    try {
      final Response response = await _dio.get(
        Endpoints.partnerCoupons.endpoint,
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        return PartnerCouponsModel.fromJson(response.data);
      } else {
        throw 'Error!';
      }
    } on DioError catch (error) {
      throw error.toString();
    }
  }
}
