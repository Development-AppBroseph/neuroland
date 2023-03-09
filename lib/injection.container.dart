import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:grow_food/features/presentation/auth/data/datasource/auth_remote_datasorce.dart';
import 'package:grow_food/features/presentation/auth/data/datasource/auth_remote_datasource_impl.dart';
import 'package:grow_food/features/presentation/auth/data/repository/auth_repository_impl.dart';
import 'package:grow_food/features/presentation/auth/domain/repository/auth_repository.dart';
import 'package:grow_food/features/presentation/auth/domain/usecases/sign_in_user.dart';
import 'package:grow_food/features/presentation/auth/domain/usecases/sign_up_user.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_in/controller/sign_in_cubit.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_up/controller/sign_up_cubit.dart';

final sl = GetIt.asNewInstance();

Future<void> init() async {
  //Cubit
  sl.registerFactory(
    () => SignUpCubit(signUpUser: sl()),
  );
  sl.registerFactory(
    () => SignInCubit(signInUser: sl()),
  );
  //Usecase
  sl.registerLazySingleton(
    () => SignUpUser(authRepository: sl()),
  );
  sl.registerLazySingleton(
    () => SignInUser(authRepository: sl()),
  );
  //Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemotehDatasource: sl()),
  );
  //Datasource
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(),
  );
  //UserData
  const flutterSecureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => flutterSecureStorage);
}
