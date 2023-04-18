import 'package:grow_food/features/presentation/profile/data/models/invite_link_model.dart';
import 'package:grow_food/features/presentation/profile/data/models/profile_model.dart';

abstract class RemoteProfileDatasource{
  Future<ProfileModel> getProfile();
  Future<InviteLinkModel> getRef();
}