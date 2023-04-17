import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:grow_food/features/presentation/auth/data/datasource/local_datasource/auth_local_datasource.dart';
import 'package:grow_food/features/presentation/auth/data/datasource/local_datasource/auth_local_datasource_impl.dart';
import 'package:grow_food/features/presentation/auth/data/datasource/remote_datasource/auth_remote_datasorce.dart';
import 'package:grow_food/features/presentation/auth/data/datasource/remote_datasource/auth_remote_datasource_impl.dart';
import 'package:grow_food/features/presentation/auth/data/repository/auth_repository_impl.dart';
import 'package:grow_food/features/presentation/auth/domain/repository/auth_repository.dart';
import 'package:grow_food/features/presentation/auth/domain/usecases/log_out.dart';
import 'package:grow_food/features/presentation/auth/domain/usecases/refresh_token.dart';
import 'package:grow_food/features/presentation/auth/domain/usecases/sign_in_user.dart';
import 'package:grow_food/features/presentation/auth/domain/usecases/sign_up_user.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_in/controller/sign_in_cubit.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_up/controller/sign_up_cubit.dart';
import 'package:grow_food/features/presentation/profile/data/datasource/remote_profile_datasource/remote_profile_datasource.dart';
import 'package:grow_food/features/presentation/profile/data/datasource/remote_profile_datasource/remote_profile_datasource_implements.dart';
import 'package:grow_food/features/presentation/profile/data/repository/profile_repository_impl.dart';
import 'package:grow_food/features/presentation/profile/domain/repository/profile_repository.dart';
import 'package:grow_food/features/presentation/profile/domain/usecase/get_profile.dart';
import 'package:grow_food/features/presentation/profile/domain/usecase/get_ref.dart';
import 'package:grow_food/features/presentation/profile/presentation/controller/profile_cubit.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/data/datasource/courses_video_datasource.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/data/datasource/courses_video_datasource_impl.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/data/repository/courses_video_repository_impl.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/repository/courses_video_repository.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/usecase/get_courses_video.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/presentation/learning/controller/actual_courses_cubit.dart';
import 'package:grow_food/features/presentation/root_screen/data/local_datasource/local_datasource.dart';
import 'package:grow_food/features/presentation/root_screen/data/local_datasource/local_datasource_impl.dart';
import 'package:grow_food/features/presentation/root_screen/data/repository/root_screen_repository_impl.dart';
import 'package:grow_food/features/presentation/root_screen/domain/repository/root_screen_repository.dart';
import 'package:grow_food/features/presentation/root_screen/domain/usecase/get_token.dart';
import 'package:grow_food/features/presentation/root_screen/presentation/root_screen/controllers/root_screen_cubit.dart';

final sl = GetIt.asNewInstance();

Future<void> init() async {
  //Cubit
  //Auth
  sl.registerFactory(
    () => SignUpCubit(signUpUser: sl()),
  );
  sl.registerFactory(
    () => SignInCubit(
      signInUser: sl(),
      userLogOut: sl(),
      refreshToken: sl(),
    ),
  );
  sl.registerFactory(
    () => RootScreenCubit(
      getToken: sl(),
      localDatasource: sl(),
    ),
  );
  //Courses
  sl.registerFactory(
    () => ActualCoursesCubit(getCoursesVideo: sl()),
  );
  //Profile
  sl.registerFactory(
    () => ProfileCubit(
      getProfile: sl(),
      getLink: sl(),
    ),
  );

  //Usecase
  //Auth
  sl.registerLazySingleton(
    () => SignUpUser(authRepository: sl()),
  );
  sl.registerLazySingleton(
    () => SignInUser(authRepository: sl()),
  );
  sl.registerLazySingleton(
    () => GetToken(rootScreenRepository: sl()),
  );
  sl.registerLazySingleton(
    () => UserLogOut(authRepository: sl()),
  );
  sl.registerLazySingleton(
    () => RefreshToken(authRepository: sl()),
  );
  //Courses
  sl.registerLazySingleton(
    () => GetCoursesVideo(coursesVideoRepository: sl()),
  );
  //Profile
  sl.registerLazySingleton(
    () => GetProfile(profileRepository: sl()),
  );
  sl.registerLazySingleton(
    () => GetLink(profileRepository: sl()),
  );

  //Repository
  //Auth
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
        authRemotehDatasource: sl(), authLocalDatasource: sl()),
  );
  sl.registerLazySingleton<RootScreenRepository>(
    () => RootScreenRepositoryImpl(localDatasource: sl()),
  );
  //Courses
  sl.registerLazySingleton<CoursesVideoRepository>(
    () => CoursesVideoRepositoryImpl(coursesVideoDatasource: sl()),
  );
  //Profile
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(remoteProfileDatasource: sl()),
  );

  //Datasource
  //Auth
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(),
  );
  sl.registerLazySingleton<LocalDatasource>(
    () => LocalDatasourceImpl(flutterSecureStorage: sl()),
  );
  sl.registerLazySingleton<AuthLocalDatasource>(
    () => AuthLocalDatasourceImpl(flutterSecureStorage: sl()),
  );
  //Courses
  sl.registerLazySingleton<CoursesVideoDatasource>(
    () => CoursesVideoDatasourceImpl(),
  );
  //Profile
  sl.registerLazySingleton<RemoteProfileDatasource>(
    () => RemoteProfileDatasourceImpl(),
  );

  //UserData
  const flutterSecureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => flutterSecureStorage);
}
