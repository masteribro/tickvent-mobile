class UpdatePasscodeRequest {
  final int oldPasscode;
  final int otp;
  final bool isMobile;
  final String deviceToken;
  final int passcode;
  final int passcodeConfirmation;

  UpdatePasscodeRequest({
    required this.oldPasscode,
    required this.otp,
    required this.isMobile,
    required this.deviceToken,
    required this.passcode,
    required this.passcodeConfirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      'old_passcode': oldPasscode,
      'otp': otp,
      'is_mobile': isMobile,
      'device_token': deviceToken,
      'passcode': passcode,
      'passcode_confirmation': passcodeConfirmation,
    };
  }
}
