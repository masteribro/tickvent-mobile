import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'api_constants.dart';
import 'api_formatted_response.dart';

enum ResponseStatus {
  successful,
  operationFailed,
  otherError,
  dataInvalid,
  connectingToServerError,
  networkError,
  whileProcessingErrors,
  unknown,
}

/// Example messages to be presented to users
extension FailureQuips on ResponseStatus {
  String get quip {
    int index = Random(DateTime.now().second).nextInt(2);
    debugPrint("Random Number Generated: $index");

    /// NOTE: Maybe have a section of quips based on error types and then select
    /// randomly BASED on [this] particular StatusType
    return [
      "Please give it another shot or come back later.We are working on it.",
      "Kindly try again later.We are working on it.",
    ][0];
  }

  String get serverError {
    return "Please give it another shot or come back later.";
  }
}

class ApiResponse {
  Response response;
  ApiFormattedResponse? formattedResponse;

  ApiResponse(this.response) {
    if (response.statusCode == kDefaultSuccessCode) {
      print("Response data: ${response.data}");
      formattedResponse = ApiFormattedResponse.fromJson(response.data);
      debugPrint("Response datae: ${response.data}");
    } else {
      formattedResponse = null;
    }
  }

  dynamic _data;
  int? _statusCode;

  dynamic get data {
    _data = response.data;
    return _data;
  }

  int? get statusCode {
    _statusCode = response.statusCode;
    return _statusCode;
  }

  ResponseStatus get responseStatus {
    debugPrint("Response Status*: ${formattedResponse?.statusCode}");

    /// MAYBE: Add other responses for dynamism
    if (response.statusCode != null &&
        response.statusCode == kDefaultSuccessCode) {
      return ResponseStatus.successful;
    } else if (response.statusCode != null &&
        response.statusCode == kDefaultSuccessCreatedCode) {
      return ResponseStatus.successful;
    } else if (response.statusCode == kStatusUnAuthorized) {
      return ResponseStatus.operationFailed;
    } else if (response.statusCode == kStatusNetworkProblem) {
      return ResponseStatus.networkError;
    } else if (formattedResponse?.statusCode == kStatusOperationFailed) {
      return ResponseStatus.operationFailed;
    } else if (formattedResponse?.statusCode == kStatusOtherErrors) {
      return ResponseStatus.otherError;
    } else if (formattedResponse?.statusCode == kStatusDataInvalid) {
      return ResponseStatus.dataInvalid;
    } else if (formattedResponse?.statusCode ==
        kStatusConnectingToServerError) {
      return ResponseStatus.connectingToServerError;
    } else if (formattedResponse?.statusCode == kStatusNetworkError) {
      return ResponseStatus.networkError;
    } else if (formattedResponse?.statusCode == kStatusWhileProcessingErrors) {
      return ResponseStatus.whileProcessingErrors;
    } else {
      return ResponseStatus.unknown;
    }
    // if (formattedResponse?.statusCode != null &&
    //     kStatusSuccessResponse.contains(formattedResponse?.statusCode)) {
    //   return ResponseStatus.successful;
    // } else if (formattedResponse?.statusCode == kStatusOperationFailed) {
    //   return ResponseStatus.operationFailed;
    // } else if (formattedResponse?.statusCode == kStatusOtherErrors) {
    //   return ResponseStatus.otherError;
    // } else if (formattedResponse?.statusCode == kStatusDataInvalid) {
    //   return ResponseStatus.dataInvalid;
    // } else if (formattedResponse?.statusCode ==
    //     kStatusConnectingToServerError) {
    //   return ResponseStatus.connectingToServerError;
    // } else if (formattedResponse?.statusCode == kStatusNetworkError) {
    //   return ResponseStatus.networkError;
    // } else if (formattedResponse?.statusCode == kStatusWhileProcessingErrors) {
    //   return ResponseStatus.whileProcessingErrors;
    // } else {
    //   return ResponseStatus.unknown;
    // }
  }
}
