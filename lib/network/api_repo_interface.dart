import 'api_response.dart';

abstract class IApiRepository {
  /// OnBoarding Repository
  Future<ApiResponse> createAccount(String email);

  // Future<ApiResponse> createPassword(CreatePasswordRequestModel model,
  //     {int? userId});
  //
  // Future<ApiResponse> getOTP(OTPType type, int? userId);
  //
  // Future<ApiResponse> verifyOTP(String otp, OTPType type, {int? userId});
  //
  // Future<ApiResponse> supportMessage(
  //     SupportMessageRequestModel request, int? userId, String photoUrl);
  //
  // Future<ApiResponse> uploadFile(UploadRequestModel request, String photoUrl);
  //
  // Future<ApiResponse> sendSupportMessage(int? supportId);
  //
  // Future<ApiResponse> getDocument();
  //
  // Future<ApiResponse> login(LoginPayloadRequestModel model);
  //
  // Future<ApiResponse> forgotPassword(String phoneNumber);
  //
  // Future<ApiResponse> updateAvatar(UpdateAvatarRequestModel model);
  //
  // Future<ApiResponse> changePassword(ChangePasswordRequestModel model);
  //
  // Future<ApiResponse> changePin(ChangePinRequestModel model);
  //
  // Future<ApiResponse> createPin(CreatePinRequestModel model);
  //
  // Future<ApiResponse> versioning();
  //
  // Future<ApiResponse> fetchCustomerData(ResolveAcctRequestModel model);
  //
  // Future<ApiResponse> getUserDetails(int userId);
  //
  // Future<ApiResponse> addAccount(String acctNum, String userId);
  //
  // Future<ApiResponse> deleteAccount( String userId);
  //
  // Future<ApiResponse> accountConnect(String acctNum, String otp, String userId);
  //
  // // Future<ApiResponse> otpPassword(String otpNumber);
  //
  // /// Transactions Repository
  // Future<ApiResponse> checkBalance(BalanceRequestModel model);
  //
  // Future<ApiResponse> getTransactionHistoryRange(
  //     TransactionPayloadResponseModel model);
  //
  // /// These methods has been deprecated. Use [transferV2]
  // // Future<ApiResponse> transfer(TransferRequestModel model);
  // //
  // // Future<ApiResponse> interTransfer(InterTransferRequestModel model);
  //
  // Future<ApiResponse> transferV2(TransferV2RequestModel model);
  //
  // Future<ApiResponse> verifyPaymentPin(VerifyPaymentRequestModel model);
  //
  // Future<ApiResponse> billingCategories();
  //
  // Future<ApiResponse> billingItems(id);
  //
  // Future<ApiResponse> getBeneficiaries(String accountId);
  //
  // Future<ApiResponse> addBeneficiaries(BeneficiariesRequestModel model);
  //
  // Future<ApiResponse> deleteBeneficiaries(index);
  //
  // Future<ApiResponse> getAccounts();
  //
  // Future<ApiResponse> setDefaultAccount(accountNum);
  //
  // Future<ApiResponse> paymentItems(id);
  //
  // Future<ApiResponse> makePayment(MakePaymentRequestModel makePaymentData, id);
  //
  // /// Core Banking Repository
  // Future<ApiResponse> getAllBanks(String accountId,
  //     {Map<String, dynamic>? extra});
  //
  // Future<ApiResponse> resolveAccount(String accountNumber, String bank,
  //     String accountId, Map<String, dynamic> extraHeaders);
  //
  // /// Register Repository
  // Future<ApiResponse> registerSavingsAcct(
  //     RegisterSavingsAcctModel request, String imageUrl);
  //
  // Future<ApiResponse> topUp(TopUpResponseModel request, id);
  //
  // Future<ApiResponse> easySaving(id);
  //
  // Future<ApiResponse> registerESavingsAcct(ESavingsAccountResponse request, id);
  //
  // Future<ApiResponse> monetaOtpAuth(String otp, id);
}
