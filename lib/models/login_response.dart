class LoginResponseModel {
  LoginResponseModel({
    this.status,
    this.data,
    this.message,
  });

  final bool? status;
  final UserData? data;
  final String? message;

  LoginResponseModel copyWith({
    bool? status,
    UserData? data,
    String? message,
  }) {
    return LoginResponseModel(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json["status"],
      data: json["data"] == null ? null : UserData.fromJson(json["data"]),
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
      };

  @override
  String toString() {
    return "$status, $data, $message, ";
  }
}

class UserData {
  UserData({
    required this.id,
    required this.fullName,
    required this.isAdmin,
    required this.email,
    required this.isVerified,
    required this.phoneNumber,
    required this.apiToken,
    required this.apiTestToken,
    required this.profileImg,
    required this.deviceToken,
    required this.organizerName,
    required this.organizerInfo,
    required this.organizerImg,
    required this.location,
    required this.emailVerifiedAt,
    required this.phoneVerifiedAt,
    required this.passwordResetTime,
    required this.profileImgUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final dynamic fullName;
  final String? isAdmin;
  final String? email;
  final String? isVerified;
  final dynamic phoneNumber;
  final String? apiToken;
  final String? apiTestToken;
  final dynamic profileImg;
  final String? deviceToken;
  final dynamic organizerName;
  final dynamic organizerInfo;
  final dynamic organizerImg;
  final dynamic location;
  final dynamic emailVerifiedAt;
  final dynamic phoneVerifiedAt;
  final DateTime? passwordResetTime;
  final dynamic profileImgUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserData copyWith({
    int? id,
    dynamic? fullName,
    String? isAdmin,
    String? email,
    String? isVerified,
    dynamic? phoneNumber,
    String? apiToken,
    String? apiTestToken,
    dynamic? profileImg,
    String? deviceToken,
    dynamic? organizerName,
    dynamic? organizerInfo,
    dynamic? organizerImg,
    dynamic? location,
    dynamic? emailVerifiedAt,
    dynamic? phoneVerifiedAt,
    DateTime? passwordResetTime,
    dynamic? profileImgUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserData(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      isAdmin: isAdmin ?? this.isAdmin,
      email: email ?? this.email,
      isVerified: isVerified ?? this.isVerified,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      apiToken: apiToken ?? this.apiToken,
      apiTestToken: apiTestToken ?? this.apiTestToken,
      profileImg: profileImg ?? this.profileImg,
      deviceToken: deviceToken ?? this.deviceToken,
      organizerName: organizerName ?? this.organizerName,
      organizerInfo: organizerInfo ?? this.organizerInfo,
      organizerImg: organizerImg ?? this.organizerImg,
      location: location ?? this.location,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      phoneVerifiedAt: phoneVerifiedAt ?? this.phoneVerifiedAt,
      passwordResetTime: passwordResetTime ?? this.passwordResetTime,
      profileImgUrl: profileImgUrl ?? this.profileImgUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json["id"],
      fullName: json["full_name"],
      isAdmin: json["is_admin"],
      email: json["email"],
      isVerified: json["is_verified"],
      phoneNumber: json["phone_number"],
      apiToken: json["api_token"],
      apiTestToken: json["api_test_token"],
      profileImg: json["profile_img"],
      deviceToken: json["device_token"],
      organizerName: json["organizer_name"],
      organizerInfo: json["organizer_info"],
      organizerImg: json["organizer_img"],
      location: json["location"],
      emailVerifiedAt: json["email_verified_at"],
      phoneVerifiedAt: json["phone_verified_at"],
      passwordResetTime: DateTime.tryParse(json["password_reset_time"] ?? ""),
      profileImgUrl: json["profile_img_url"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "is_admin": isAdmin,
        "email": email,
        "is_verified": isVerified,
        "phone_number": phoneNumber,
        "api_token": apiToken,
        "api_test_token": apiTestToken,
        "profile_img": profileImg,
        "device_token": deviceToken,
        "organizer_name": organizerName,
        "organizer_info": organizerInfo,
        "organizer_img": organizerImg,
        "location": location,
        "email_verified_at": emailVerifiedAt,
        "phone_verified_at": phoneVerifiedAt,
        "password_reset_time": passwordResetTime?.toIso8601String(),
        "profile_img_url": profileImgUrl,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return "$id, $fullName, $isAdmin, $email, $isVerified, $phoneNumber, $apiToken, $apiTestToken, $profileImg, $deviceToken, $organizerName, $organizerInfo, $organizerImg, $location, $emailVerifiedAt, $phoneVerifiedAt, $passwordResetTime, $profileImgUrl, $createdAt, $updatedAt, ";
  }
}
