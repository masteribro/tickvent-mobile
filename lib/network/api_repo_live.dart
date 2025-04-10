import 'package:flutter/cupertino.dart';
import '../app/app.locator.dart';
import '../services/user_service.dart';
import 'api_repo_interface.dart';
import 'api_response.dart';
import 'api_service.dart';

class ApiRepositoryLive extends IApiRepository {
  @override
  // Future<ApiResponse> createPassword(CreatePasswordRequestModel model,
  //     {int? userId}) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.put,
  //     endpoint:
  //         "onboard/customer/${locator<UserService>().currentUser.data?.customer?.id ?? userId}/password/create",
  //     reqBody: model.toJson(),
  //   );
  //   return response;
  // }

  @override
  Future<ApiResponse> createAccount(String email) async {
    ApiResponse response = await locator<ApiService>().call(
        method: HttpMethod.post,
        endpoint: "/register",
        reqBody: {"email": email, "is_mobile": false, "device_token": "dscsdccwdds"});
    return response;
  }

  // @override
  // Future<ApiResponse> getOTP(OTPType type, int? userId) async {
  //   debugPrint(userId.toString());
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.get,
  //     endpoint:
  //         "${type.urlPrefix}/${locator<UserService>().userId ?? userId}/otp/${type.urlSuffix}",
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> login(LoginPayloadRequestModel model) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.post,
  //     endpoint: "auth/customer/login",
  //     reqBody: model.toJson(),
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> verifyOTP(String otp, OTPType type, {int? userId}) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.get,
  //     endpoint:
  //         "${type.urlPrefix}/${locator<UserService>().userId ?? userId}/otp/$otp/verify/${type.urlSuffix}",
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> forgotPassword(String phoneNumber) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.get,
  //     endpoint: 'auth/customer/$phoneNumber/forgotpassword',
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> updateAvatar(UpdateAvatarRequestModel model) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.post,
  //     endpoint: "settings/customer/avartar/update",
  //     formData: FormData.fromMap(model.toJson()),
  //     useFormData: true,
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> checkBalance(BalanceRequestModel model) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.post,
  //     endpoint: 'transactions/customer/check-balance',
  //     reqBody: model.toJson(),
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> getTransactionHistoryRange(
  //     TransactionPayloadResponseModel model) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.post,
  //     endpoint: "transactions/customer/history",
  //     reqBody: model.toJson(),
  //   );
  //   return response;
  // }
  //
  // /// This method has been deprecated. Use [transferV2]
  // // @override
  // // Future<ApiResponse> transfer(TransferRequestModel model) async {
  // //   ApiResponse response = await locator<ApiService>().call(
  // //     method: HttpMethod.post,
  // //     endpoint: "transactions/customer/transfer",
  // //     reqBody: model.toJson(),
  // //   );
  // //   return response;
  // // }
  //
  // @override
  // Future<ApiResponse> changePassword(ChangePasswordRequestModel model) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.put,
  //     endpoint:
  //         "settings/customer/${locator<UserService>().userId}/password/change",
  //     reqBody: model.toJson(),
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> changePin(ChangePinRequestModel model) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.put,
  //     endpoint:
  //         "settings/customer/${locator<UserService>().userId}/paymentpin/change",
  //     reqBody: model.toJson(),
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> deleteAccount(String userId) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.delete,
  //     endpoint:
  //         "https://regent-mfb.moneta.ng/api/v1/customer/delete-account/$userId",
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> createPin(CreatePinRequestModel model) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.put,
  //     endpoint:
  //         "settings/customer/${locator<UserService>().userId}/paymentpin/create",
  //     reqBody: model.toJson(),
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> getAllBanks(String accountId,
  //     {Map<String, dynamic>? extra}) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.post,
  //     endpoint:
  //         "https://core-banking.moneta.ng/api/v2/banking/bank-codes/$accountId",
  //     altHeaders: extra ?? {},
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> resolveAccount(String accountNumber, String bank,
  //     String accountId, Map<String, dynamic> extraHeaders) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.post,
  //     endpoint: "https://core-banking.moneta.ng/api/v2/banking/name-enquiry",
  //     reqBody: {
  //       "account_number": accountNumber,
  //       "bank_code": bank,
  //       "account_id": accountId,
  //     },
  //     altHeaders: extraHeaders,
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> fetchCustomerData(ResolveAcctRequestModel model) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //       method: HttpMethod.post,
  //       endpoint: "onboard/customer/onboarding",
  //       reqBody: model.toJson());
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> addAccount(String acctNum, String userId) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.post,
  //     endpoint: "onboard/customer/add-account/$userId",
  //     reqBody: {"AccountNumber": acctNum, "UserId": userId},
  //     protected: true,
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> getUserDetails(int userId) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.get,
  //     endpoint: "customer/$userId",
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> versioning() async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.get,
  //     endpoint: "get/version",
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> getBeneficiaries(String accountId) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.get,
  //     endpoint: "https://regent-mfb.moneta.ng/api/beneficiary/get/$accountId",
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> addBeneficiaries(BeneficiariesRequestModel model) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //       method: HttpMethod.post,
  //       endpoint: "https://regent-mfb.moneta.ng/api/beneficiary/add",
  //       reqBody: model.toJson());
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> deleteBeneficiaries(index) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.delete,
  //     endpoint: "https://regent-mfb.moneta.ng/api/beneficiary/delete/$index",
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> getDocument() async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.get,
  //     endpoint:
  //         "/settings/customer/customer-file/${locator<UserService>().userId}",
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> verifyPaymentPin(VerifyPaymentRequestModel model) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //       method: HttpMethod.post,
  //       endpoint: "settings/customer/paymentpin/verify",
  //       reqBody: model.toJson());
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> monetaOtpAuth(otp, id) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //       method: HttpMethod.post,
  //       endpoint: "/onboard/customer/auth/moneta_otp",
  //       reqBody: {"OTP": otp, "id": id});
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> registerSavingsAcct(
  //     RegisterSavingsAcctModel request, imageUrl) async {
  //   FormData formData = FormData();
  //   formData.files
  //       .add(MapEntry("PhotoUrl", await MultipartFile.fromFile(imageUrl)));
  //   formData.fields.addAll(request
  //       .toJson()
  //       .map((key, value) => MapEntry(key, value.toString()))
  //       .entries);
  //   debugPrint('get image url: ${formData.fields.toString()}');
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.post,
  //     endpoint: "onboard/customer/create",
  //     useFormData: true,
  //     formData: formData,
  //   );
  //
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> registerESavingsAcct(
  //     ESavingsAccountResponse request, id) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //       method: HttpMethod.post,
  //       endpoint: "customer/createAccount/$id",
  //       reqBody: request.toJson());
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> topUp(TopUpResponseModel request, id) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //       method: HttpMethod.post,
  //       endpoint: "customer/easy-savings/$id",
  //       reqBody: request.toJson());
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> easySaving(id) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.get,
  //     endpoint: "transactions/customer/easy-savings-transaction/$id",
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> accountConnect(
  //     String acctNum, String otp, String userId) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.post,
  //     endpoint: "onboard/customer/account-connect/$userId",
  //     reqBody: {
  //       "AccountNumber": acctNum,
  //       "OTP": otp,
  //     },
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> billingCategories() async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.get,
  //     endpoint: "transactions/billing/biller-categories",
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> billingItems(id) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.get,
  //     endpoint: "transactions/billing/biller-category/$id",
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> paymentItems(id) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.get,
  //     endpoint: "transactions/billing/payment-options/$id",
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> getAccounts() async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.get,
  //     endpoint: "customer-accounts",
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> setDefaultAccount(accountNum) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //       method: HttpMethod.post,
  //       endpoint: "set-active-account",
  //       reqBody: {"account_number": accountNum});
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> makePayment(
  //     MakePaymentRequestModel makePaymentData, id) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //       method: HttpMethod.post,
  //       endpoint: "transactions/billing/bill/payment-initialization/$id",
  //       reqBody: makePaymentData.toJson());
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> transferV2(TransferV2RequestModel model) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //       method: HttpMethod.post,
  //       endpoint: "transactions/customer/transfer",
  //       reqBody: model.toJson());
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> supportMessage(
  //     SupportMessageRequestModel request, int? userId, photoUrl) async {
  //   FormData formData = FormData();
  //   formData.files
  //       .add(MapEntry("Photo", await MultipartFile.fromFile(photoUrl)));
  //   formData.fields.addAll(request
  //       .toJson()
  //       .map((key, value) => MapEntry(key, value.toString()))
  //       .entries);
  //   debugPrint('get image url: ${formData.fields.toString()}');
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.post,
  //     endpoint: "support/create/$userId",
  //     useFormData: true,
  //     formData: formData,
  //   );
  //   return response;
  // }
  //
  // /// Duplicated mail sent, remove [sendSupportMessage] later
  //
  // @override
  // Future<ApiResponse> sendSupportMessage(supportId) async {
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.get,
  //     endpoint: "support/send/$supportId",
  //   );
  //   return response;
  // }
  //
  // @override
  // Future<ApiResponse> uploadFile(
  //     UploadRequestModel request, String photoUrl) async {
  //   FormData formData = FormData();
  //   formData.files
  //       .add(MapEntry("file_name", await MultipartFile.fromFile(photoUrl)));
  //   formData.fields.addAll(request
  //       .toJson()
  //       .map((key, value) => MapEntry(key, value.toString()))
  //       .entries);
  //   debugPrint('get image url: ${formData.fields.toString()}');
  //   ApiResponse response = await locator<ApiService>().call(
  //     method: HttpMethod.post,
  //     endpoint: "settings/customer/customer-file",
  //     useFormData: true,
  //     formData: formData,
  //   );
  //   return response;
  // }
}
