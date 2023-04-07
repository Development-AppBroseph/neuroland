import 'package:dio/dio.dart';
import 'package:grow_food/features/presentation/auth/data/datasource/local_datasource/auth_local_datasource.dart';
import 'package:grow_food/features/presentation/auth/data/datasource/remote_datasource/auth_remote_datasorce.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_in/controller/sign_in_cubit.dart';
import 'package:grow_food/injection.container.dart';

class DataSourceInterceptor extends QueuedInterceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String accessToken = await sl<AuthLocalDatasource>().getUserToken();
    if (accessToken == '') {
      super.onRequest(options, handler);
    } else {
      final headers = options.headers;
      headers['Authorization'] = 'Token $accessToken';
      super.onRequest(options.copyWith(headers: headers), handler);
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response!.statusCode == 401) {
      try {
        await sl<SignInCubit>().refreshUserToken();
        final response =
            await sl<AuthRemoteDatasource>().fetch(err.requestOptions);
        return handler.resolve(response);
      } catch (e) {
        super.onError(err, handler);
      }
    } else {
      super.onError(err, handler);
    }
  }
}
