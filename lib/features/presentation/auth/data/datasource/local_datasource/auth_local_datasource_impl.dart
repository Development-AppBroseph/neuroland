import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grow_food/core/constants/back_constants.dart';
import 'package:grow_food/features/presentation/auth/data/datasource/local_datasource/auth_local_datasource.dart';

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final FlutterSecureStorage flutterSecureStorage;

  AuthLocalDatasourceImpl({required this.flutterSecureStorage});
  @override
  Future<void> saveUserToken(String token) async {
    flutterSecureStorage.write(
      key: BackConstants.savedUSerToken,
      value: jsonEncode(token),
    );
  }
}
