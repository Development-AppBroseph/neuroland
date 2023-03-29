class TokenModel {
  final String token;

  TokenModel({required this.token});

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        token: json['auth_token'],
      );
}
