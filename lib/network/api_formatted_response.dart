import 'package:flutter/cupertino.dart';

class ApiFormattedResponse {
  dynamic status;
  String? statusCode;
  dynamic data;
  String? message;

  ApiFormattedResponse({
    this.status,
    this.statusCode,
    this.data,
    this.message,
  });

  factory ApiFormattedResponse.fromJson(Map<String, dynamic> json) {
    return ApiFormattedResponse(
      status: json["status"],
      statusCode: json["statusCode"]?.toString(),
      data: json["data"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "statusCode": statusCode,
        "data": data?.toJson(),
        "message": message,
      };
}
