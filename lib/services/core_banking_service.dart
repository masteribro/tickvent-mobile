// import 'package:dart_either/dart_either.dart';
// import 'package:regent_mfb/network/api_constants.dart';
// import 'package:regent_mfb/network/api_repo_interface.dart';
// import 'package:regent_mfb/network/api_repo_live.dart';
// import 'package:regent_mfb/network/api_repo_mock.dart';
// import 'package:regent_mfb/network/api_response.dart';
// import 'package:regent_mfb/ui/views/transfer/select_bank/select_bank_model.dart';
// import 'package:tickvent/network/api_repo_interface.dart';
//
// import '../network/api_repo_live.dart';
// import '../network/api_repo_mock.dart';
//
// class CoreBankingService {
//   late IApiRepository _apiRepo;
//   final bool mock;
//
//   CoreBankingService({this.mock = false}) {
//     _apiRepo = mock ? ApiRepositoryMock() : ApiRepositoryLive();
//   }
//
//   Future<Either<String, List<SelectBankModel>>> getAllBanks(String accountId,
//       {Map<String, dynamic>? extra}) async {
//     ApiResponse response = await _apiRepo.getAllBanks(accountId, extra: extra);
//     switch (response.statusCode) {
//       case 200:
//         return Right(List.from(response.data[dataKey])
//             .map((bank) => SelectBankModel.fromJson(bank))
//             .toList());
//       case 100:
//       case 400:
//       case 300:
//       default:
//         return Left(response.data[messageKey]);
//     }
//   }
//
//   Future<Either<String, String>> resolveAccountName(
//       String accountNumber,
//       String bankCode,
//       String accountId,
//       Map<String, dynamic> extraHeaders) async {
//     ApiResponse response = await _apiRepo.resolveAccount(
//         accountNumber, bankCode, accountId, extraHeaders);
//     switch (response.statusCode) {
//       case 200:
//         return Right(response.data[dataKey]["name"]);
//       case 100:
//       case 400:
//       case 300:
//       default:
//         return Left(response.data[messageKey]);
//     }
//   }
// }
