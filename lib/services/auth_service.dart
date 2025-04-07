import '../network/api_constants.dart';
import '../network/api_repo_interface.dart';
import '../network/api_repo_live.dart';
import '../network/api_repo_mock.dart';
import 'package:dart_either/dart_either.dart';

import '../network/api_response.dart';

class AuthService {
  late IApiRepository _apiRepo;
  final bool mock;

  AuthService({this.mock = false}) {
    _apiRepo = mock ? ApiRepositoryMock() : ApiRepositoryLive();
  }

  Future<Either<String, dynamic>> createAccount(String email) async {
    ApiResponse response = await _apiRepo.createAccount(email);
    switch (response.responseStatus) {
      case ResponseStatus.successful:
        return Right(response.data[messageKey]);
      case ResponseStatus.operationFailed:
        return Left(response.data[messageKey]);
      case ResponseStatus.otherError:
        return Left(response.data[messageKey]);
      case ResponseStatus.dataInvalid:
        return Left(response.data[messageKey]);
      case ResponseStatus.unknown:
        return Left(response.responseStatus.quip);
      case ResponseStatus.connectingToServerError:
        return Left(response.responseStatus.quip);
      default:
        return Left(response.responseStatus.quip);
    }
  }
//
//   Future<Either<String, String>> getOTP(
//       {int? userId, OTPType otpType = OTPType.forgotPassword}) async {
//     ApiResponse response = await _apiRepo.getOTP(otpType, userId);
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(response.data[messageKey]);
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.unknown:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//   Future<Either<String, String>> verifyOTP(
//     String otp, {
//     userId,
//     OTPType otpType = OTPType.forgotPassword,
//   }) async {
//     ApiResponse response =
//         await _apiRepo.verifyOTP(otp, otpType, userId: userId);
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(response.data[messageKey]);
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.unknown:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       default:
//         return Left(response.data[messageKey]);
//     }
//   }
//
//   Future<Either<String, String>> setNewPassword(
//       CreatePasswordRequestModel model,
//       {int? userId}) async {
//     ApiResponse response = await _apiRepo.createPassword(
//       model,
//       userId: userId,
//     );
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(response.data[messageKey]);
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.unknown:
//         return Left(response.responseStatus.quip);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.responseStatus.quip);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//   Future<Either<String, String>> addAccount(
//       String acctNum, String userId) async {
//     ApiResponse response = await _apiRepo.addAccount(acctNum, userId);
//     debugPrint(response.response.data.toString());
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(response.data[messageKey]);
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.whileProcessingErrors:
//         return Left(response.data);
//       case ResponseStatus.unknown:
//         return  Left(response.data[messageKey]);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//
//
//   Future<Either<String, dynamic>> deleteAccount(String userId) async {
//     ApiResponse response = await _apiRepo.deleteAccount(userId);
//     debugPrint(response.response.data.toString());
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(response.data);
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.whileProcessingErrors:
//         return Left(response.data);
//       case ResponseStatus.unknown:
//         return const Left(defaultAccountErrorMessage);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//   Future<Either<String, UserAcctDetailsResponseModel>> getUserDetails(
//       int userId) async {
//     ApiResponse response = await _apiRepo.getUserDetails(userId);
//     debugPrint(response.response.data.toString());
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(UserAcctDetailsResponseModel.fromJson(response.data));
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.whileProcessingErrors:
//         return Left(response.data);
//       case ResponseStatus.unknown:
//         return const Left(defaultAccountErrorMessage);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//   Future<Either<String, String>> accountConnect(
//       String acctNum, String otp, String userId) async {
//     ApiResponse response = await _apiRepo.accountConnect(acctNum, otp, userId);
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(response.data[messageKey]);
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.unknown:
//         return Left(response.responseStatus.quip);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//   Future<Either<String, FetchCustomerDataResponseModel>> fetchAccountDetails(
//       ResolveAcctRequestModel model) async {
//     ApiResponse response = await _apiRepo.fetchCustomerData(model);
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right((FetchCustomerDataResponseModel.fromJson(response.data)));
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.unknown:
//         return Left(response.responseStatus.quip);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//   Future<Either<String, LoginResponseModel>> login(
//       LoginPayloadRequestModel model) async {
//     ApiResponse response = await _apiRepo.login(model);
//     debugPrint("status code: ${response.statusCode}");
//     debugPrint("status : ${response.responseStatus}");
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(LoginResponseModel.fromJson(response.data));
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.unknown:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//   Future<Either<String, ForgotPasswordModel>> forgotPassword(
//       String phoneNumber) async {
//     ApiResponse response = await _apiRepo.forgotPassword(phoneNumber);
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(ForgotPasswordModel.fromJson(response.data));
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.unknown:
//         return Left(response.responseStatus.quip);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//   Future<Either<String, String>> updateAvatar(
//       UpdateAvatarRequestModel model) async {
//     ApiResponse response = await _apiRepo.updateAvatar(model);
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right((response.data[messageKey]));
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.unknown:
//         return Left(response.responseStatus.quip);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//   Future<Either<String, String>> changePassword(
//       ChangePasswordRequestModel model) async {
//     ApiResponse response = await _apiRepo.changePassword(model);
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right((response.data[messageKey]));
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.unknown:
//         return Left(response.responseStatus.quip);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//   Future<Either<String, String>> changePin(ChangePinRequestModel model) async {
//     ApiResponse response = await _apiRepo.changePin(model);
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right((response.data[messageKey]));
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.unknown:
//         return Left(response.responseStatus.quip);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//   Future<Either<String, String>> monetaOtp(otp, id) async {
//     ApiResponse response = await _apiRepo.monetaOtpAuth(otp, id);
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right((response.data[messageKey]));
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.unknown:
//         return Left(response.responseStatus.quip);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.responseStatus.quip);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//   Future<Either<String, String>> createPin(CreatePinRequestModel model) async {
//     ApiResponse response = await _apiRepo.createPin(model);
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right((response.data[messageKey]));
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.unknown:
//         return Left(response.responseStatus.quip);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//   Future<Either<String, CreateAccountResponse>> createSavingsAcct(
//       RegisterSavingsAcctModel model, imageUrl) async {
//     ApiResponse response = await _apiRepo.registerSavingsAcct(model, imageUrl);
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(CreateAccountResponse.fromJson(response.data));
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.unknown:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.networkError:
//         return Left(response.data[messageKey]);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//   Future<Either<String, ESavingsCreatedResponse>> createESavingsAcct(
//       ESavingsAccountResponse model, id) async {
//     ApiResponse response = await _apiRepo.registerESavingsAcct(model, id);
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(ESavingsCreatedResponse.fromJson(response.data));
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.unknown:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//   Future<Either<String, TopUpAcctModel>> topUp(
//       TopUpResponseModel model, id) async {
//     ApiResponse response = await _apiRepo.topUp(model, id);
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right((TopUpAcctModel.fromJson(response.data)));
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.unknown:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//   Future<Either<String, String>> easySaving(id) async {
//     ApiResponse response = await _apiRepo.easySaving(id);
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right((response.data[messageKey]));
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.unknown:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//   Future<Either<String, SupportMessageResponseModel>> supportMessage(
//       SupportMessageRequestModel request, userId, String photoUrl) async {
//     ApiResponse response =
//         await _apiRepo.supportMessage(request, userId, photoUrl);
//     debugPrint(
//         "Response statusCode for supportMessage: ${response.statusCode}");
//
// //The responseStatus is returning null, so i used the statusCode instead of the responseStatus code
//     switch (response.response.statusCode) {
//       case 200:
//         return Right(SupportMessageResponseModel.fromJson(response.data));
//
//       default:
//         return Left(response.data[messageKey]);
//     }
//   }
//
//   // Future<Either<String, SupportMessageResponseModel>> supportMessage(
//   //     SupportMessageRequestModel request, userId, String photoUrl) async {
//   //   ApiResponse response =
//   //       await _apiRepo.supportMessage(request, userId, photoUrl);
//   //   debugPrint("response ${response.response.statusCode}");
//   //   switch (response.responseStatus) {
//   //     case ResponseStatus.successful:
//   //       return Right((SupportMessageResponseModel.fromJson(response.data)));
//   //     case ResponseStatus.operationFailed:
//   //       return Left(response.responseStatus.quip);
//   //     case ResponseStatus.otherError:
//   //       return Left(response.responseStatus.quip);
//   //     case ResponseStatus.dataInvalid:
//   //       return Left(response.data[messageKey]);
//   //     case ResponseStatus.unknown:
//   //       return Left(response.responseStatus.quip);
//   //     case ResponseStatus.connectingToServerError:
//   //       return Left(response.responseStatus.quip);
//   //     default:
//   //       return Left(response.responseStatus.quip);
//   //   }
//   // }
//
//   Future<Either<String, String>> sendSupportMessage(supportId) async {
//     ApiResponse response = await _apiRepo.sendSupportMessage(supportId);
//     debugPrint(
//         "Response statusCode for sendSupportMessage: ${response.statusCode}");
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(response.data["status"] ?? response.data[messageKey]);
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.unknown:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//   Future<Either<String, String>> uploadFile(
//       UploadRequestModel request, photoUrl) async {
//     ApiResponse response = await _apiRepo.uploadFile(request, photoUrl);
//     debugPrint("Response data: ${response.data}");
//     print("message: ${response.data["message"]}");
// //The responseStatus is returning null, so i used the statusCode instead of the responseStatus code
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(response.data["status"] ?? response.data[messageKey]);
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.unknown:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//   Future<Either<String, GetDocumentResponseModel>> getDocument() async {
//     ApiResponse response = await _apiRepo.getDocument();
//     debugPrint("Response statusCode for getDocument1: ${response.statusCode}");
//     debugPrint(
//         "Response statusCode for getDocument2: ${response.response.statusCode}");
//     switch (response.response.statusCode) {
//       case 200:
//         return Right(GetDocumentResponseModel.fromJson(response.data));
//
//       default:
//         return Left(response.data[messageKey]);
//     }
//   }
//
//   Future<Either<String, VersionResponseModel>> versioning() async {
//     ApiResponse response = await _apiRepo.versioning();
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(VersionResponseModel.fromJson(response.data));
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.unknown:
//         return Left(response.responseStatus.quip);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
}
