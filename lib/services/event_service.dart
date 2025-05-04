import '../network/api_constants.dart';
import '../network/api_repo_interface.dart';
import '../network/api_repo_live.dart';
import '../network/api_repo_mock.dart';
import 'package:dart_either/dart_either.dart';

import '../network/api_response.dart';

class EventService {
  late IApiRepository _apiRepo;
  final bool mock;

  EventService({this.mock = false}) {
    _apiRepo = mock ? ApiRepositoryMock() : ApiRepositoryLive();
  }

  Future<Either<String, dynamic>> featuredEvents() async {
    ApiResponse response = await _apiRepo.featuredEvents();
    switch (response.responseStatus) {
      case ResponseStatus.successful:
        return Right(response.data);
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

  Future<Either<String, String>> upcomingEvents() async {
    ApiResponse response = await _apiRepo.upcomingEvents();
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

  Future<Either<String, String>> weekEndEvents() async {
    ApiResponse response = await _apiRepo.weekEndEvents();
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

  Future<Either<String, String>> getConfectionary() async {
    ApiResponse response = await _apiRepo.getConfectionary();
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

  Future<Either<String, String>> createEvent() async {
    ApiResponse response = await _apiRepo.getConfectionary();
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

  Future<Either<String, String>> addFeedBack(
      String message, int eventId) async {
    ApiResponse response = await _apiRepo.addFeedBack(message, eventId);
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
