import 'package:grow_food/features/presentation/profile/domain/entiti/invite_link_entiti.dart';

class InviteLinkModel extends InviteLinkEntiti {
  InviteLinkModel({
    required final String inviteLink,
  }) : super(
          inviteLink: inviteLink,
        );
  factory InviteLinkModel.fromJson(Map<String, dynamic> json) =>
      InviteLinkModel(
        inviteLink: json['invite_link'],
      );
}
