// import 'dart:developer';
//
// import 'package:dart_either/dart_either.dart';
// import 'package:flutter/material.dart';
// import 'package:regent_mfb/models/balance_response_model.dart';
// import 'package:regent_mfb/models/transaction_payload_response_model.dart';
// import 'package:regent_mfb/models/transferv2_request_model.dart';
// import 'package:regent_mfb/models/verify_payment_request_model.dart';
// import 'package:regent_mfb/network/api_constants.dart';
// import 'package:regent_mfb/network/api_repo_interface.dart';
// import 'package:regent_mfb/network/api_repo_live.dart';
// import 'package:regent_mfb/network/api_repo_mock.dart';
// import 'package:regent_mfb/network/api_response.dart';
//
// import '../models/BalanceRequestModel.dart';
// import '../models/active_account_response.dart';
// import '../models/beneficiaries_request_model.dart';
// import '../models/billing_category_response_model.dart';
// import '../models/billing_items_response_model.dart';
// import '../models/get_beneficiaries_model.dart';
// import '../models/make_payment_request_model.dart';
// import '../models/payment_item_response_model.dart';
// import '../models/retrieve_account_response_model.dart';
// import '../models/transaction_response_response_model.dart';
//
// class TransactionService {
//   late IApiRepository _apiRepo;
//   final bool mock;
//
//   TransactionService({this.mock = false}) {
//     _apiRepo = mock ? ApiRepositoryMock() : ApiRepositoryLive();
//   }
//   //TODO: change the parameters to required value
//   Future<Either<String, BalanceResponseModel>> checkBalance(
//       {String? accountNumber, String? paymentPin}) async {
//     ApiResponse response = await _apiRepo
//         .checkBalance(BalanceRequestModel(accountNumber: accountNumber ?? ''));
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(BalanceResponseModel.fromJson(response.data[dataKey]));
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
//   Future<Either<String, List<TransactionData>>> getTransactions({
//     String? accountNumber,
//     DateTimeRange? range,
//   }) async {
//     ApiResponse response = await _apiRepo.getTransactionHistoryRange(
//         TransactionPayloadResponseModel(
//             accountNumber: accountNumber ?? "",
//             fromDate: range?.start ??
//                 DateTime.now().subtract(const Duration(days: 30)),
//             toDate: range?.end ?? DateTime.now(),
//             pageSize: "10",
//             pageNumber: "1"));
//
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         final rawTransactions = response.data[dataKey];
//         List<TransactionData> parsedTransactions = [];
//         if (rawTransactions != null && rawTransactions is List) {
//           for (final transaction in rawTransactions) {
//             try {
//               final parsedTransaction = TransactionData.fromJson(transaction);
//               parsedTransactions.add(parsedTransaction);
//             } catch (e, stacktrace) {
//               log(e.toString(), stackTrace: stacktrace);
//             }
//           }
//         }
//         return Right(parsedTransactions);
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
//   /// This method has been deprecated. Use [transferV2]
//
//   // Future<Either<String, IntraResponseModel>> makeIntraTransfer(
//   //     {required String sourceAccountNumber,
//   //     required String destAccountNumber,
//   //     required String amount,
//   //     required String paymentPin,
//   //     String? description}) async {
//   //   ApiResponse response = await _apiRepo.transfer(TransferRequestModel(
//   //       fromAccountNumber: sourceAccountNumber,
//   //       toAccountNumber: destAccountNumber,
//   //       narration: description ?? "no-description",
//   //       amount: amount,
//   //       paymentPin: paymentPin));
//   //   debugPrint("Get Status: ${response.responseStatus}");
//   //   switch (response.responseStatus) {
//   //     case ResponseStatus.successful:
//   //       return Right(IntraResponseModel.fromJson(response.data[dataKey]));
//   //     case ResponseStatus.operationFailed:
//   //       return Left(response.data[messageKey] ?? response.responseStatus.quip);
//   //     case ResponseStatus.otherError:
//   //       return Left(response.data[messageKey] ?? response.responseStatus.quip);
//   //     case ResponseStatus.dataInvalid:
//   //       return Left(response.data[messageKey]);
//   //     case ResponseStatus.unknown:
//   //       return Left(response.responseStatus.quip);
//   //     case ResponseStatus.connectingToServerError:
//   //       return Left(response.responseStatus.quip);
//   //     case ResponseStatus.networkError:
//   //       return const Left(
//   //           'Failed to connect to server. Kindly try again later.');
//   //     default:
//   //       return Left(response.responseStatus.quip);
//   //   }
//   // }
//   //
//   // Future<Either<String, InterResponseModel>> makeInterTransfer(
//   //     {required String sourceAccountNumber,
//   //     required String destAccountNumber,
//   //     required String payerName,
//   //     required String receiverName,
//   //     required String receiverBankCode,
//   //     required String receiverPhoneNumber,
//   //     required String amount,
//   //     required String paymentPin,
//   //     String? description}) async {
//   //   ApiResponse response = await _apiRepo.interTransfer(
//   //       InterTransferRequestModel(
//   //           payerName: payerName,
//   //           payerAccountNumber: sourceAccountNumber,
//   //           receiverName: receiverName,
//   //           receiverAccountNumber: destAccountNumber,
//   //           receiverBankCode: receiverBankCode,
//   //           receiverPhoneNumber: receiverPhoneNumber,
//   //           narration: description ?? "no-description",
//   //           amount: amount,
//   //           paymentPin: paymentPin));
//   //   debugPrint("Get Status: ${response.responseStatus}");
//   //   switch (response.responseStatus) {
//   //     case ResponseStatus.successful:
//   //       return Right(InterResponseModel.fromJson(response.data[dataKey]));
//   //     case ResponseStatus.operationFailed:
//   //       return Left(response.data[messageKey] ?? response.responseStatus.quip);
//   //     case ResponseStatus.otherError:
//   //       return Left(response.data[messageKey] ?? response.responseStatus.quip);
//   //     case ResponseStatus.dataInvalid:
//   //       return Left(response.data[messageKey]);
//   //     case ResponseStatus.unknown:
//   //       return Left(response.responseStatus.quip);
//   //     case ResponseStatus.connectingToServerError:
//   //       return Left(response.responseStatus.quip);
//   //     case ResponseStatus.networkError:
//   //       return const Left(
//   //           'Failed to connect to server. Kindly try again later.');
//   //     default:
//   //       return Left(response.responseStatus.quip);
//   //   }
//   // }
//
//   Future<Either<String, String>> transferV2({
//     required String sourceAccountNumber,
//     required String destAccountNumber,
//     required String receiverName,
//     required String receiverBankCode,
//     required String amount,
//     required String paymentPin,
//     required String? longitude,
//     required String? latitude,
//     bool saveBeneficiary = false,
//   }) async {
//     ApiResponse response = await _apiRepo.transferV2(TransferV2RequestModel(
//       accountNumber: sourceAccountNumber,
//       amount: amount,
//       beneficiaryAccountNumber: destAccountNumber,
//       beneficiaryBankCode: receiverBankCode,
//       beneficiaryName: receiverName,
//       saveBeneficiary: saveBeneficiary,
//       paymentPin: paymentPin,
//       longitude: longitude,
//       latitude: latitude,
//     ));
//     debugPrint("Get Status: ${response.responseStatus}");
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(response.data[messageKey]);
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey] ?? response.responseStatus.quip);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey] ?? response.responseStatus.quip);
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
//   Future<Either<String, String>> verifyPinPayment(
//       String customerId, String paymentPin) async {
//     ApiResponse response = await _apiRepo.verifyPaymentPin(
//         VerifyPaymentRequestModel(id: customerId, paymentPin: paymentPin));
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
//   Future<Either<String, BillingCategoryResponseModel>>
//       billingCategories() async {
//     ApiResponse response = await _apiRepo.billingCategories();
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(BillingCategoryResponseModel.fromJson(response.data));
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey] ?? response.responseStatus.quip);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey] ?? response.responseStatus.quip);
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
//   Future<Either<String, BillingItemResponseModel>> billingItems(id) async {
//     ApiResponse response = await _apiRepo.billingItems(id);
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(BillingItemResponseModel.fromJson(response.data));
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey] ?? response.responseStatus.quip);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey] ?? response.responseStatus.quip);
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
//   Future<Either<String, PaymentItemResponseModel>> paymentItems(id) async {
//     ApiResponse response = await _apiRepo.paymentItems(id);
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(PaymentItemResponseModel.fromJson(response.data));
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey] ?? response.responseStatus.quip);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey] ?? response.responseStatus.quip);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.unknown:
//         return Left(response.data[messageKey]);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//   Future<Either<String, String>> makePayment(
//       MakePaymentRequestModel makePaymentData, id) async {
//     ApiResponse response = await _apiRepo.makePayment(makePaymentData, id);
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(response.data[messageKey]);
//       case ResponseStatus.operationFailed:
//         return Left(response.data[messageKey] ?? response.responseStatus.quip);
//       case ResponseStatus.otherError:
//         return Left(response.data[messageKey] ?? response.responseStatus.quip);
//       case ResponseStatus.dataInvalid:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.unknown:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.connectingToServerError:
//         return Left(response.data[messageKey]);
//       case ResponseStatus.whileProcessingErrors:
//         return Left(response.data[messageKey] ?? response.responseStatus.quip);
//       default:
//         return Left(response.responseStatus.quip);
//     }
//   }
//
//   Future<Either<String, GetBeneficiariesRequestModel>> getBeneficiary(
//       {String? accountId}) async {
//     ApiResponse response = await _apiRepo.getBeneficiaries(accountId ?? "");
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(GetBeneficiariesRequestModel.fromJson(response.data));
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
//   Future<Either<String, String>> addBeneficiary(
//       BeneficiariesRequestModel beneficiariesRequestModel) async {
//     ApiResponse response =
//         await _apiRepo.addBeneficiaries(beneficiariesRequestModel);
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(response.data[messageKey] ?? response.data);
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
//   Future<Either<String, String>> deleteBeneficiary(index) async {
//     ApiResponse response = await _apiRepo.deleteBeneficiaries(index);
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
//   Future<Either<String, RetriveAccountResponseModel>> getAccounts() async {
//     ApiResponse response = await _apiRepo.getAccounts();
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(RetriveAccountResponseModel.fromJson(response.data));
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
//   Future<Either<String, ActiveAccountResponse>> setDefaultAccount(
//       accountNum) async {
//     ApiResponse response = await _apiRepo.setDefaultAccount(accountNum);
//     switch (response.responseStatus) {
//       case ResponseStatus.successful:
//         return Right(ActiveAccountResponse.fromJson(response.data));
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
// }
