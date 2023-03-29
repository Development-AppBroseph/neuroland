class ErrorModel {
  final String error;

  ErrorModel({required this.error});
  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        error: json['error'],
      );
}
