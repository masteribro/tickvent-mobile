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

  Future<Either<String, String>> sendOtp(String email, int otp) async {
    ApiResponse response = await _apiRepo.sendOtp( email,  otp);
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

  Future<Either<String, String>> login(String email, int otp) async {
    ApiResponse response = await _apiRepo.login( email,  otp);
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


}
