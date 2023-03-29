import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grow_food/core/constants/back_constants.dart';
import 'package:grow_food/features/presentation/root_screen/data/local_datasource/local_datasource.dart';

class LocalDatasourceImpl implements LocalDatasource {
  final FlutterSecureStorage flutterSecureStorage;

  LocalDatasourceImpl({required this.flutterSecureStorage});
  @override
  Future<String?> getToken() async {
    return await flutterSecureStorage.read(key: BackConstants.savedUSerToken);
  }
}
