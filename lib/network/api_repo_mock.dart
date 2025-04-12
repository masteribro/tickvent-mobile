import '../models/change_passcode_request.dart';
import 'api_repo_interface.dart';
import 'api_response.dart';

class ApiRepositoryMock extends IApiRepository {
  @override
  Future<ApiResponse> createAccount(String email) {
    // TODO: implement getDataFromAccountNumber
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> sendOtp(String email, int otp) {
    // TODO: implement sendOtp
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> login(String email, int otp) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> createPin(UpdatePasscodeRequest request) {
    // TODO: implement createPin
    throw UnimplementedError();
  }
  // @override
  // Future<ApiResponse> createPassword(CreatePasswordRequestModel models,
  //     {int? userId}) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //
  //   return ApiResponse(
  //     Response(
  //       statusCode: 200,
  //       data: {
  //         "status": "success",
  //         "message": "password updated successfully",
  //         "data": {
  //           "id": 1,
  //           "PhoneNumber": "08066579703",
  //           "AccountNumber": "0987654321",
  //           "LastName": "DEMO",
  //           "OtherNames": "OLAKUNLE",
  //           "Email": "demo@gmail.com",
  //           "PhoneVerifiedAt": "2023-06-02T07:39:05.000000Z",
  //           "AccessLevel": "0",
  //           "PhotoUrl": null,
  //           "AvartarUrl": null,
  //           "IsBlocked": 0,
  //           "deleted_at": null,
  //           "created_at": null,
  //           "updated_at": "2023-06-02T07:44:21.000000Z"
  //         },
  //         "statusCode": "00"
  //       },
  //       requestOptions: RequestOptions(path: ""),
  //     ),
  //   );
  // }

  // @override
  // Future<ApiResponse> getDataFromAccountNumber(
  //     String accountNumber, String bvn) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //
  //   return ApiResponse(
  //     Response(
  //       statusCode: 200,
  //       data: {
  //         "status": "success",
  //         "statusCode": "00",
  //         "data": {
  //           "PhoneNumber": "07030739661",
  //           "AccountNumber": "1100243780",
  //           "LastName": "Hussaini",
  //           "OtherNames": "string",
  //           "Email": "maimunahussaini66@gmail.com",
  //           "AccessLevel": "1",
  //           "updated_at": "2023-06-02T16:25:17.000000Z",
  //           "created_at": "2023-06-02T16:25:17.000000Z",
  //           "id": 2
  //         },
  //         "message": "Customer data successfully  fetch and stored!"
  //       },
  //       requestOptions: RequestOptions(path: ""),
  //     ),
  //   );
  // }
  //
  // @override
  // Future<ApiResponse> getOTP(OTPType type, userId) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //
  //   return ApiResponse(
  //     Response(
  //       statusCode: 200,
  //       data: {
  //         "status": "success",
  //         "statusCode": "00",
  //         "message": "successful"
  //       },
  //       requestOptions: RequestOptions(path: ""),
  //     ),
  //   );
  // }
  //
  // @override
  // Future<ApiResponse> login(LoginPayloadRequestModel models) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //
  //   return ApiResponse(
  //     Response(
  //       statusCode: 200,
  //       data: {
  //         "status": "success",
  //         "statusCode": "00",
  //         "message": "successful loggedin",
  //         "data": {
  //           "customer": {
  //             "id": 1,
  //             "PhoneNumber": "08066579703",
  //             "AccountNumber": "0987654321",
  //             "LastName": "DEMO",
  //             "OtherNames": "OLAKUNLE",
  //             "Email": "demo@gmail.com",
  //             "PhoneVerifiedAt": "2023-06-02T07:39:05.000000Z",
  //             "AccessLevel": "0",
  //             "PhotoUrl": null,
  //             "AvartarUrl": null,
  //             "IsBlocked": 0,
  //             "deleted_at": null,
  //             "created_at": null,
  //             "updated_at": "2023-06-02T07:48:18.000000Z"
  //           },
  //           "token": "2|pFRwv250L5EgmQBiios0vNEnx3qSEuUv6gwO1eFf"
  //         }
  //       },
  //       requestOptions: RequestOptions(path: ""),
  //     ),
  //   );
  // }
  //
  // @override
  // Future<ApiResponse> verifyOTP(String otp, OTPType type, {int? userId}) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Response response = Response(
  //     statusCode: 200,
  //     data: {
  //       "status": "success",
  //       "statusCode": "00",
  //       "data": {
  //         "id": 1,
  //         "PhoneNumber": "08066579703",
  //         "AccountNumber": "0987654321",
  //         "LastName": "DEMO",
  //         "OtherNames": "OLAKUNLE",
  //         "Email": "demo@gmail.com",
  //         "PhoneVerifiedAt": "2023-06-02T07:39:05.000000Z",
  //         "AccessLevel": "0",
  //         "PhotoUrl": null,
  //         "AvartarUrl": null,
  //         "IsBlocked": 0,
  //         "deleted_at": null,
  //         "created_at": null,
  //         "updated_at": "2023-06-02T07:39:05.000000Z"
  //       },
  //       "message": "OTP validated"
  //     },
  //     requestOptions: RequestOptions(path: ""),
  //   );
  //   return ApiResponse(
  //     response,
  //   );
  // }
  //
  // @override
  // Future<ApiResponse> forgotPassword(String phoneNumber) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Response response = Response(
  //     statusCode: 200,
  //     data: {
  //       "status": "success",
  //       "message": "password updated successfully",
  //       "data": {
  //         "id": 1,
  //         "PhoneNumber": "08066579703",
  //         "AccountNumber": "0987654321",
  //         "LastName": "DEMO",
  //         "OtherNames": "OLAKUNLE",
  //         "Email": "demo@gmail.com",
  //         "PhoneVerifiedAt": "2023-06-02T07:39:05.000000Z",
  //         "AccessLevel": "0",
  //         "PhotoUrl": null,
  //         "AvartarUrl": null,
  //         "IsBlocked": 0,
  //         "deleted_at": null,
  //         "created_at": null,
  //         "updated_at": "2023-06-02T07:44:21.000000Z"
  //       },
  //       "statusCode": "00"
  //     },
  //     requestOptions: RequestOptions(path: ""),
  //   );
  //   return ApiResponse(
  //     response,
  //   );
  // }
  //
  // @override
  // Future<ApiResponse> updateAvatar(UpdateAvatarRequestModel models) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Response response = Response(
  //     statusCode: 200,
  //     data: {
  //       "status": "success",
  //       "message": "Avartar updated successfully",
  //       "data": [],
  //       "statusCode": "00"
  //     },
  //     requestOptions: RequestOptions(path: ""),
  //   );
  //   return ApiResponse(
  //     response,
  //   );
  // }
  //
  // @override
  // Future<ApiResponse> checkBalance(BalanceRequestModel models) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Response response = Response(
  //     statusCode: 200,
  //     data: {
  //       "status": "success",
  //       "message": "Account Balance Retrieved",
  //       "data": {"AvailableBalance": 100, "LedgerBalance": 100},
  //       "statusCode": "00"
  //     },
  //     requestOptions: RequestOptions(path: ""),
  //   );
  //   return ApiResponse(
  //     response,
  //   );
  // }
  //
  // @override
  // Future<ApiResponse> getTransactionHistoryRange(
  //     TransactionPayloadResponseModel models) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Response response = Response(
  //     statusCode: 200,
  //     data: {
  //       "status": "success",
  //       "message": "Account Balance Retrieved",
  //       "data": {"AvailableBalance": 100, "LedgerBalance": 100},
  //       "statusCode": "00"
  //     },
  //     requestOptions: RequestOptions(path: ""),
  //   );
  //   return ApiResponse(
  //     response,
  //   );
  // }
  //
  // // @override
  // // Future<ApiResponse> transfer(TransferRequestModel models) async {
  // //   await Future.delayed(const Duration(seconds: 2));
  // //   Response response = Response(
  // //     statusCode: 200,
  // //     data: {
  // //       "status": "success",
  // //       "message": "Account Balance Retrieved",
  // //       "data": {"AvailableBalance": 100, "LedgerBalance": 100},
  // //       "statusCode": "00"
  // //     },
  // //     requestOptions: RequestOptions(path: ""),
  // //   );
  // //   return ApiResponse(
  // //     response,
  // //   );
  // // }
  //
  // @override
  // Future<ApiResponse> changePassword(ChangePasswordRequestModel models) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Response response = Response(
  //     statusCode: 200,
  //     data: {
  //       "status": "success",
  //       "message": "password updated successfully",
  //       "data": true,
  //       "statusCode": "00"
  //     },
  //     requestOptions: RequestOptions(path: ""),
  //   );
  //   return ApiResponse(
  //     response,
  //   );
  // }
  //
  // @override
  // Future<ApiResponse> getAllBanks(String accountId,
  //     {Map<String, dynamic>? extra}) {
  //   // TODO: implement getAllBanks Mock
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> resolveAccount(String accountNumber, String bank,
  //     String accountId, Map<String, dynamic> extraHeaders) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Response response = Response(
  //     statusCode: 200,
  //     data: {
  //       "status": "success",
  //       "message": "Account Balance Retrieved",
  //       "data": {"AvailableBalance": 100, "LedgerBalance": 100},
  //       "statusCode": "00"
  //     },
  //     requestOptions: RequestOptions(path: ""),
  //   );
  //   return ApiResponse(
  //     response,
  //   );
  // }
  //
  // @override
  // Future<ApiResponse> changePin(ChangePinRequestModel models) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Response response = Response(
  //     statusCode: 200,
  //     data: {
  //       "status": "success",
  //       "message": "payment PIN updated successfully",
  //       "data": true,
  //       "statusCode": "00"
  //     },
  //     requestOptions: RequestOptions(path: ""),
  //   );
  //   return ApiResponse(
  //     response,
  //   );
  // }
  //
  // @override
  // Future<ApiResponse> createPin(CreatePinRequestModel models) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Response response = Response(
  //     statusCode: 200,
  //     data: {
  //       "status": "success",
  //       "message": "Payment PIN created successfully",
  //       "data": true,
  //       "statusCode": "00"
  //     },
  //     requestOptions: RequestOptions(path: ""),
  //   );
  //   return ApiResponse(
  //     response,
  //   );
  // }
  //
  // @override
  // Future<ApiResponse> verifyPaymentPin(VerifyPaymentRequestModel models) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Response response = Response(
  //     statusCode: 200,
  //     data: {
  //       "status": "success",
  //       "message": "payment PIN verified successfully",
  //       "data": [],
  //       "statusCode": "00"
  //     },
  //     requestOptions: RequestOptions(path: ""),
  //   );
  //   return ApiResponse(
  //     response,
  //   );
  // }
  //
  // @override
  // Future<ApiResponse> registerSavingsAcct(
  //     RegisterSavingsAcctModel request, imageUrl) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Response response = Response(
  //     statusCode: 200,
  //     data: {
  //       "status": "Ok",
  //       "statusCode": 200,
  //       "message": "Successfully Registered and Created User Bank Account",
  //       "data": {
  //         "data": {"cookies": {}, "transferStats": {}},
  //         "status": "Failed"
  //       },
  //       "user details": {
  //         "PhoneNumber": "08151457820",
  //         "LastName": "Mohammed",
  //         "OtherNames": "Ibrahim",
  //         "Email": "danz@gmail.com",
  //         "Address": "Maitanma Abuja",
  //         "NationalIdentityNumber": "2601770182",
  //         "Gender": "Male",
  //         "AccountType": "1",
  //         "BVN": "81176646912",
  //         "PhotoUrl":
  //             "https://staging-regent-mfb.moneta.ng/uploads/customers/photo/42879fc954403d6dfd65a1a5bfdad5c335817.png",
  //         "UserToken": "795|SoeoKlDQkVgfcyAqii2bTjBVURGCvXNaiVOortUy",
  //         "updated_at": "2023-09-20T11:25:00.000000Z",
  //         "created_at": "2023-09-20T11:25:00.000000Z",
  //         "id": 4
  //       }
  //     },
  //     requestOptions: RequestOptions(path: ""),
  //   );
  //   return ApiResponse(
  //     response,
  //   );
  // }
  //
  // @override
  // Future<ApiResponse> monetaOtpAuth(String otp, id) {
  //   // TODO: implement monetaOtpAuth
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> registerESavingsAcct(
  //     ESavingsAccountResponse request, id) {
  //   // TODO: implement registerESavingsAcct
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> topUp(TopUpResponseModel request, id) {
  //   // TODO: implement topUp
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> fetchCustomerData(ResolveAcctRequestModel models) {
  //   // TODO: implement fetchCustomerData
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> addAccount(String acctNum, String userId) {
  //   // TODO: implement addAccount
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> accountConnect(
  //     String acctNum, String otp, String userId) {
  //   // TODO: implement accountConnect
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> billingCategories() {
  //   // TODO: implement billingCategories
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> billingItems(id) {
  //   // TODO: implement billingItems
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> paymentItems(id) {
  //   // TODO: implement paymentItems
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> makePayment(MakePaymentRequestModel makePaymentData, id) {
  //   // TODO: implement makePayment
  //   throw UnimplementedError();
  // }
  //
  // // @override
  // // Future<ApiResponse> interTransfer(InterTransferRequestModel models) {
  // //
  // //   throw UnimplementedError();
  // // }
  //
  // @override
  // Future<ApiResponse> easySaving(id) {
  //   // TODO: implement easySaving
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> supportMessage(
  //     SupportMessageRequestModel request, int? userId, photoUrl) {
  //   // TODO: implement supportMessage
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> sendSupportMessage(int? supportId) {
  //   // TODO: implement sendSupportMessage
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> uploadFile(UploadRequestModel request, String photoUrl) {
  //   // TODO: implement uploadFile
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> getDocument() {
  //   // TODO: implement getDocument
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> transferV2(TransferV2RequestModel models) {
  //   // TODO: implement transferV2
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> getBeneficiaries(String accountId) {
  //   // TODO: implement getBeneficiaries
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> addBeneficiaries(BeneficiariesRequestModel models) {
  //   // TODO: implement addBeneficiaries
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> deleteBeneficiaries(index) {
  //   // TODO: implement deleteBeneficiaries
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> versioning() {
  //   // TODO: implement versioning
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> getUserDetails(int userId) {
  //   // TODO: implement getUserDetails
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> getAccounts() {
  //   // TODO: implement getAccounts
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> setDefaultAccount(accountNum) {
  //   // TODO: implement setDefaultAccount
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<ApiResponse> deleteAccount(String userId) {
  //   // TODO: implement deleteAccount
  //   throw UnimplementedError();
  // }
}
