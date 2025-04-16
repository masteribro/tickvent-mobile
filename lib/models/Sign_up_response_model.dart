class SignUpResponseModel {
  final bool status;
  final String message;
  final VerificationData? data;

  SignUpResponseModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? VerificationData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class VerificationData {
  final String email;
  final String updatedAt;
  final String createdAt;
  final int id;

  VerificationData({
    required this.email,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory VerificationData.fromJson(Map<String, dynamic> json) {
    return VerificationData(
      email: json['email'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }
}
