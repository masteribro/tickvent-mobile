import '../models/change_passcode_request.dart';
import '../models/create_passcode_request.dart';
import 'api_response.dart';

abstract class IApiRepository {
  /// AuthService Repository
  Future<ApiResponse> createAccount(String email);

  Future<ApiResponse> sendOtp(String email, int otp);

  Future<ApiResponse> login(String email, int otp);

  Future<ApiResponse> createPin(UpdatePasscodeRequest request);

  Future<ApiResponse> createPassCode(CreatePasscodeRequest request);

  Future<ApiResponse> featuredEvents();

  Future<ApiResponse> checkPasscodeStatus(String email);

  Future<ApiResponse> upcomingEvents();

  Future<ApiResponse> weekEndEvents();

  Future<ApiResponse> getConfectionary();

  Future<ApiResponse> createEvent();

  Future<ApiResponse> addFeedBack(String message, int eventId);

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
  // Future<ApiResponse> login(LoginPayloadRequestModel models);
  //
  // Future<ApiResponse> forgotPassword(String phoneNumber);
  //
  // Future<ApiResponse> updateAvatar(UpdateAvatarRequestModel models);
  //
  // Future<ApiResponse> changePassword(ChangePasswordRequestModel models);
  //
  // Future<ApiResponse> changePin(ChangePinRequestModel models);
  //
  // Future<ApiResponse> createPin(CreatePinRequestModel models);
  //
  // Future<ApiResponse> versioning();
  //
  // Future<ApiResponse> fetchCustomerData(ResolveAcctRequestModel models);
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
  // Future<ApiResponse> checkBalance(BalanceRequestModel models);
  //
  // Future<ApiResponse> getTransactionHistoryRange(
  //     TransactionPayloadResponseModel models);
  //
  // /// These methods has been deprecated. Use [transferV2]
  // // Future<ApiResponse> transfer(TransferRequestModel models);
  // //
  // // Future<ApiResponse> interTransfer(InterTransferRequestModel models);
  //
  // Future<ApiResponse> transferV2(TransferV2RequestModel models);
  //
  // Future<ApiResponse> verifyPaymentPin(VerifyPaymentRequestModel models);
  //
  // Future<ApiResponse> billingCategories();
  //
  // Future<ApiResponse> billingItems(id);
  //
  // Future<ApiResponse> getBeneficiaries(String accountId);
  //
  // Future<ApiResponse> addBeneficiaries(BeneficiariesRequestModel models);
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
