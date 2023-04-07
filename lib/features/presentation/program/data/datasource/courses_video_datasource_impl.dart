import 'package:dio/dio.dart';
import 'package:grow_food/core/constants/constants.dart';
import 'package:grow_food/core/helpers/auth_interceptor/auth_interceptor.dart';
import 'package:grow_food/features/presentation/program/data/datasource/courses_video_datasource.dart';
import 'package:grow_food/features/presentation/program/data/models/video_curses/courses_video_model.dart';
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
}
