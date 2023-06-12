import 'package:grow_food/features/presentation/profile/data/models/invite_link_model.dart';
import 'package:grow_food/features/presentation/profile/data/models/profile_model.dart';

abstract class RemoteProfileDatasource {
  Future<ProfileModel> getProfile();
  Future<InviteLinkModel> getRef();
  Future<ProfileModel> editAvatar({required String avatar});
  Future<ProfileModel> editName({required String name});
  Future<ProfileModel> editNumber({required String number});
  Future<ProfileModel> editEmail({required String email});
  Future<void>deleteAccount();
}
