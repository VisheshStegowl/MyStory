class GeneralErrorModel {
  // bool? error;
  String? code;
  String? message;
  String? data;

  GeneralErrorModel({this.message, this.code, this.data});

  factory GeneralErrorModel.fromJson(Map<String, dynamic>? json) {
    return GeneralErrorModel(
        code: json?['code'], message: json?['message'], data: json?['data']);
    // error = json['error'];
    // if (json["message"] is List) {
    // message =
    // // } else {
    // //   message = json['message'] ?? json["msg"] ?? "Something went wrong!";
    // // }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
