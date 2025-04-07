// import 'package:regent_mfb/app/app.locator.dart';
// import 'package:regent_mfb/models/login_response_model.dart' as data;
// import 'package:regent_mfb/models/resolve_account_response_model.dart';
// import 'package:regent_mfb/ui/common/app_assets.dart';
// import 'package:regent_mfb/ui/common/local_storage.dart';
// import 'package:regent_mfb/ui/common/storage_dir.dart';
//
// import '../models/active_account_response.dart';
// import '../models/create_account_request_model.dart';
// import '../models/e_savings_account_response.dart';
// import '../models/user_acct_details_response_model.dart';
//
// class UserService {
//   data.LoginResponseModel _currentUser = data.LoginResponseModel();
//   ESavingsAccountResponse _eSavingsAccount = ESavingsAccountResponse();
//
//   void refreshUser() {
//     /// Fetch recent user information and repopulate user object
//   }
//
//   void authenticateUser() {
//     /// This may serve as the authentication point for new users
//     /// or may be relegated to other parts of the app
//   }
//
//   void setUser(ResolveAccountResponseModel userModel) {
//     _currentUser = currentUser.copyWith(
//         data: data.Data().copyWith(
//       customer: data.Customer().copyWith(
//         id: userModel.id,
//         phoneNumber: userModel.phoneNumber,
//         accountNumber: userModel.accountNumber,
//         lastName: userModel.lastName,
//         otherNames: userModel.otherNames,
//         email: userModel.email,
//         accessLevel: userModel.accessLevel,
//         updatedAt: userModel.updatedAt,
//         createdAt: userModel.createdAt,
//       ),
//     ));
//   }
//
//   // void setCustomerData(FetchCustomerDataResponseModel userModel) {
//   //   _currentUser = currentUser.copyWith(
//   //       data: Data().copyWith(
//   //         customer: Customer().copyWith(
//   //           id: userModel.id,
//   //           phoneNumber: userModel.phoneNumber,
//   //           accountNumber: userModel.accountNumber,
//   //           lastName: userModel.lastName,
//   //           otherNames: userModel.otherNames,
//   //           email: userModel.email,
//   //           accessLevel: userModel.accessLevel,
//   //           updatedAt: userModel.updatedAt,
//   //           createdAt: userModel.createdAt,
//   //
//   //         ),
//   //       ));
//   // }
//
//   void createAccountCredentials(CreateAccountResponse accountModel) {
//     _eSavingsAccount = eSavingsAccount.copyWith(
//         accountType: accountModel.data?.customer?.accountType,
//         bvn: accountModel.data?.customer?.bvn,
//         lastName: accountModel.data?.customer?.lastName,
//         otherNames: accountModel.data?.customer?.otherNames,
//         gender: accountModel.data?.customer?.gender,
//         placeOfBirth: accountModel.data?.customer?.placeOfBirth,
//         dateOfBirth: accountModel.data?.customer?.dateOfBirth,
//         address: accountModel.data?.customer?.address,
//         phoneNumber: accountModel.data?.customer?.phoneNumber,
//         nationalIdentityNumber:
//             accountModel.data?.customer?.nationalIdentityNumber);
//   }
//
//   void setUserFromAuth(data.LoginResponseModel userModel) {
//     /// TODO: Set User Values here
//     _currentUser = currentUser.copyWith(
//         data: data.Data().copyWith(
//             customer: data.Customer().copyWith(
//                 userToken: userModel.data?.customer?.userToken,
//                 otherAccount: userModel.data?.customer?.otherAccount,
//                 accountId: userModel.data?.customer?.accountId,
//                 id: userModel.data?.customer?.id,
//                 phoneNumber: userModel.data?.customer?.phoneNumber,
//                 accountNumber: userModel.data?.customer?.accountNumber,
//                 lastName: userModel.data?.customer?.lastName,
//                 otherNames: userModel.data?.customer?.otherNames,
//                 email: userModel.data?.customer?.email,
//                 phoneVerifiedAt: userModel.data?.customer?.phoneVerifiedAt,
//                 accessLevel: userModel.data?.customer?.accessLevel,
//                 photoUrl: userModel.data?.customer?.photoUrl,
//                 avartarUrl: userModel.data?.customer?.avartarUrl,
//                 isBlocked: userModel.data?.customer?.isBlocked,
//                 deletedAt: userModel.data?.customer?.deletedAt,
//                 updatedAt: userModel.data?.customer?.updatedAt,
//                 createdAt: userModel.data?.customer?.createdAt,
//                 address: userModel.data?.customer?.address,
//                 placeOfBirth: userModel.data?.customer?.placeOfBirth,
//                 dateOfBirth: userModel.data?.customer?.dateOfBirth,
//                 bvn: userModel.data?.customer?.bvn,
//                 gender: userModel.data?.customer?.gender,
//                 nationalIdentityNumber:
//                     userModel.data?.customer?.nationalIdentityNumber,
//                 easySavingsInfo: userModel.data?.customer?.easySavingsInfo,
//                 isPaymentpinSet: userModel.data?.customer?.isPaymentpinSet
//                 // hasPin: userModel.customer?.hasPin,
//                 ),
//             token: userModel.data?.token));
//
//     /// Store user token here
//     locator<LocalStorage>().save(StorageDir.authToken, currentUser.data?.token);
//
//     /// Store user id here
//     locator<LocalStorage>()
//         .save(StorageDir.currentUserId, currentUser.data?.customer?.id);
//   }
//
//   void setUserFrmSelectAcct(ActiveAccountResponse userModel) {
//     _currentUser = currentUser.copyWith(
//         data: data.Data().copyWith(
//       customer: data.Customer().copyWith(
//         accountId: userModel.data?.accountId,
//         id: userModel.data?.id,
//         phoneNumber: userModel.data?.phoneNumber,
//         accountNumber: userModel.data?.accountNumber,
//         lastName: userModel.data?.lastName,
//         otherNames: userModel.data?.otherNames,
//         email: userModel.data?.email,
//         accessLevel: userModel.data?.accessLevel,
//         updatedAt: DateTime.parse(userModel.data?.updatedAt ?? ""),
//         createdAt: DateTime.parse(userModel.data?.createdAt ?? ""),
//         isPaymentpinSet: userModel.data?.isPaymentPinSet.toString(),
//         isBlocked: userModel.data?.isBlocked,
//         avartarUrl: userModel.data?.avatarUrl,
//         accountType: userModel.data?.accountType,
//         userToken: userModel.data?.userToken,
//         // otherAccount: userModel.data?.otherAccount,
//
//       ),
//     ));
//   }
//
//   void setAllUserData(UserAcctDetailsResponseModel userModel) {
//     _currentUser = currentUser.copyWith(
//         data: data.Data().copyWith(
//       customer: data.Customer().copyWith(
//         accountId: userModel.data?.accountId,
//         id: userModel.data?.id,
//         phoneNumber: userModel.data?.phoneNumber,
//         accountNumber: userModel.data?.accountNumber,
//         lastName: userModel.data?.lastName,
//         otherNames: userModel.data?.otherNames,
//         email: userModel.data?.email,
//         accessLevel: userModel.data?.accessLevel,
//         updatedAt: userModel.data?.updatedAt,
//         createdAt: userModel.data?.createdAt,
//         isPaymentpinSet: userModel.data?.isPaymentpinSet,
//         isBlocked: userModel.data?.isBlocked,
//         avartarUrl: userModel.data?.avartarUrl,
//         accountType: userModel.data?.accountType,
//         userToken: userModel.data?.userToken,
//         otherAccount: userModel.data?.otherAccount,
//
//       ),
//     ));
//   }
//
//   String get userAvatar => currentUser.data?.customer?.avartarUrl ?? kcAvatar_1;
//   data.LoginResponseModel get currentUser => _currentUser;
//   ESavingsAccountResponse get eSavingsAccount => _eSavingsAccount;
//   int? get userId => currentUser.data?.customer?.id;
// }
