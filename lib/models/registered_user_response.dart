class RegisteredUserResponse {
  final bool status;
  final String message;
  final UserInfo? data;

  RegisteredUserResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory RegisteredUserResponse.fromJson(Map<String, dynamic> json) {
    return RegisteredUserResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? UserInfo.fromJson(json['data']) : null,
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


class UserInfo {
  final int id;
  final String? fullName;
  final String isAdmin;
  final String email;
  final bool isVerified;
  final String? phoneNumber;
  final String apiToken;
  final String apiTestToken;
  final String? profileImg;
  final String? deviceToken;
  final String? organizerName;
  final String? organizerInfo;
  final String? organizerImg;
  final String? location;
  final String? emailVerifiedAt;
  final String? phoneVerifiedAt;
  final String? passwordResetTime;
  final String? profileImgUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserInfo({
    required this.id,
    this.fullName,
    required this.isAdmin,
    required this.email,
    required this.isVerified,
    this.phoneNumber,
    required this.apiToken,
    required this.apiTestToken,
    this.profileImg,
    this.deviceToken,
    this.organizerName,
    this.organizerInfo,
    this.organizerImg,
    this.location,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    this.passwordResetTime,
    this.profileImgUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'],
      fullName: json['full_name'],
      isAdmin: json['is_admin'] ?? "0",
      email: json['email'],
      isVerified: json['is_verified'],
      phoneNumber: json['phone_number'],
      apiToken: json['api_token'],
      apiTestToken: json['api_test_token'],
      profileImg: json['profile_img'],
      deviceToken: json['device_token'],
      organizerName: json['organizer_name'],
      organizerInfo: json['organizer_info'],
      organizerImg: json['organizer_img'],
      location: json['location'],
      emailVerifiedAt: json['email_verified_at'],
      phoneVerifiedAt: json['phone_verified_at'],
      passwordResetTime: json['password_reset_time'],
      profileImgUrl: json['profile_img_url'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'is_admin': isAdmin,
      'email': email,
      'is_verified': isVerified,
      'phone_number': phoneNumber,
      'api_token': apiToken,
      'api_test_token': apiTestToken,
      'profile_img': profileImg,
      'device_token': deviceToken,
      'organizer_name': organizerName,
      'organizer_info': organizerInfo,
      'organizer_img': organizerImg,
      'location': location,
      'email_verified_at': emailVerifiedAt,
      'phone_verified_at': phoneVerifiedAt,
      'password_reset_time': passwordResetTime,
      'profile_img_url': profileImgUrl,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  UserInfo copyWith({
    int? id,
    String? fullName,
    String? isAdmin,
    String? email,
    bool? isVerified,
    String? phoneNumber,
    String? apiToken,
    String? apiTestToken,
    String? profileImg,
    String? deviceToken,
    String? organizerName,
    String? organizerInfo,
    String? organizerImg,
    String? location,
    String? emailVerifiedAt,
    String? phoneVerifiedAt,
    String? passwordResetTime,
    String? profileImgUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserInfo(
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
}
