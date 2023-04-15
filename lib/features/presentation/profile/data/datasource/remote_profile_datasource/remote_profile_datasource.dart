import 'package:grow_food/features/presentation/profile/data/models/profile_model.dart';

abstract class RemoteProfileDatasource{
  Future<ProfileModel> getProfile();
}