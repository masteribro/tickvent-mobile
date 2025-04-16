class CreatePasscodeRequest {
  final String email;
  final bool isMobile;
  final int passcode;
  final int passcodeConfirmation;

  CreatePasscodeRequest({
    required this.email,
    required this.isMobile,
    required this.passcode,
    required this.passcodeConfirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'is_mobile': isMobile,
      'passcode': passcode,
      'passcode_confirmation': passcodeConfirmation,
    };
  }
}
