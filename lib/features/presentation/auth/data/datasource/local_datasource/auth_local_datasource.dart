abstract class AuthLocalDatasource{
  Future<void> saveUserToken(String token);
  Future<void> deleteUserToken();
}