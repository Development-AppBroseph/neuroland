import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:grow_food/features/presentation/auth/data/datasource/auth_remote_datasorce.dart';
import 'package:grow_food/features/presentation/auth/data/datasource/auth_remote_datasource_impl.dart';
import 'package:grow_food/features/presentation/auth/data/repository/auth_repository_impl.dart';
import 'package:grow_food/features/presentation/auth/domain/repository/auth_repository.dart';
import 'package:grow_food/features/presentation/auth/domain/usecases/sign_up_user.dart';
import 'package:grow_food/features/presentation/auth/presentation/sign_up/controller/sign_up_cubit.dart';

final sl = GetIt.asNewInstance();

Future<void> init() async {
  //Cubit
  sl.registerFactory(
    () => SignUpCubit(signUpUser: sl()),
  );
  //USecase
  sl.registerLazySingleton(
    () => SignUpUser(authRepository: sl()),
  );
  //Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(autRemotehDatasource: sl()),
  );
  //Datasource
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(),
  );
  //USerData
  const flutterSecureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => flutterSecureStorage);
}
