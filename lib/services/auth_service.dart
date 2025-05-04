import 'package:tickvent/models/login_response.dart';

import '../models/Sign_up_response_model.dart';
import '../models/create_passcode_request.dart';
import '../models/registered_user_response.dart';
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

  Future<Either<String, SignUpResponseModel>> createAccount(String email) async {
    ApiResponse response = await _apiRepo.createAccount(email);
    switch (response.responseStatus) {
      case ResponseStatus.successful:
        return Right(SignUpResponseModel.fromJson(response.data) );
      case ResponseStatus.operationFailed:
        return Left(response.data[messageKey]);
      case ResponseStatus.otherError:
        return Left(response.data[messageKey]);
      case ResponseStatus.dataInvalid:
        return Left(response.data[messageKey]);
      case ResponseStatus.unknown:
        return Left(response.data[messageKey]);
      case ResponseStatus.connectingToServerError:
        return Left(response.data[messageKey]);
      default:
        return Left(response.data[messageKey]);
    }
  }

  Future<Either<String, RegisteredUserResponse>> sendOtp(String email, int otp) async {
    ApiResponse response = await _apiRepo.sendOtp(email, otp);
    switch (response.responseStatus) {
      case ResponseStatus.successful:
        return Right(RegisteredUserResponse.fromJson(response.data));
      case ResponseStatus.operationFailed:
        return Left(response.data[messageKey]);
      case ResponseStatus.otherError:
        return Left(response.data[messageKey]);
      case ResponseStatus.dataInvalid:
        return Left(response.data[messageKey]);
      case ResponseStatus.unknown:
        return Left(response.data[messageKey]);
      case ResponseStatus.connectingToServerError:
        return Left(response.data[messageKey]);
      default:
        return Left(response.responseStatus.quip);
    }
  }

  Future<Either<String, LoginResponseModel>> login(
      String email, int passCode) async {
    ApiResponse response = await _apiRepo.login(email, passCode);
    switch (response.responseStatus) {
      case ResponseStatus.successful:
        return Right(LoginResponseModel.fromJson(response.data));
      case ResponseStatus.operationFailed:
        return Left(response.data[messageKey]);
      case ResponseStatus.otherError:
        return Left(response.data[messageKey]);
      case ResponseStatus.dataInvalid:
        return Left(response.data[messageKey]);
      case ResponseStatus.unknown:
        return Left(response.data[messageKey]);
      case ResponseStatus.connectingToServerError:
        return Left(response.data[messageKey]);
      default:
        return Left(response.responseStatus.quip);
    }
  }

  Future<Either<String, String>> setPassCode(
      CreatePasscodeRequest request) async {
    ApiResponse response = await _apiRepo.createPassCode(request);
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
        return Left(response.data[messageKey]);
      case ResponseStatus.connectingToServerError:
        return Left(response.data[messageKey]);
      default:
        return Left(response.responseStatus.quip);
    }
  }

  Future<Either<String, bool>> checkPasscodeStatus(
      String email) async {
    ApiResponse response = await _apiRepo.checkPasscodeStatus(email);
    switch (response.responseStatus) {
      case ResponseStatus.successful:
        return Right(response.data[statusKey]);
      case ResponseStatus.operationFailed:
        return Left(response.data[messageKey]);
      case ResponseStatus.otherError:
        return Left(response.data[messageKey]);
      case ResponseStatus.dataInvalid:
        return Left(response.data[messageKey]);
      case ResponseStatus.unknown:
        return Left(response.data[messageKey]);
      case ResponseStatus.connectingToServerError:
        return Left(response.data[messageKey]);
      default:
        return Left(response.data[messageKey]);
    }
  }
}
