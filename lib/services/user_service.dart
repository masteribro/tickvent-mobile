import 'dart:convert';

import '../app/app.locator.dart';
import '../models/login_response.dart';
import '../models/registered_user_response.dart';
import '../ui/common/local_storage.dart';
import '../ui/common/storage_dir.dart';

class UserService {
  LoginResponseModel _currentUser = LoginResponseModel();

  void authenticateUser() {
    /// This may serve as the authentication point for new users
    /// or may be relegated to other parts of the app
  }

  void setUser(LoginResponseModel userModel) {
    _currentUser = currentUser.copyWith(
        data: UserData(
            id: userModel.data?.id,
            fullName: userModel.data?.fullName,
            isAdmin: userModel.data?.isAdmin,
            email: userModel.data?.email,
            isVerified: userModel.data?.isVerified,
            phoneNumber: userModel.data?.phoneNumber,
            apiToken: userModel.data?.apiToken,
            apiTestToken: userModel.data?.apiTestToken,
            profileImg: userModel.data?.profileImg,
            deviceToken: userModel.data?.deviceToken,
            organizerName: userModel.data?.organizerImg,
            organizerInfo: userModel.data?.organizerInfo,
            organizerImg: userModel.data?.organizerImg,
            location: userModel.data?.location,
            emailVerifiedAt: userModel.data?.emailVerifiedAt,
            phoneVerifiedAt: userModel.data?.phoneVerifiedAt,
            passwordResetTime: userModel.data?.passwordResetTime,
            profileImgUrl: userModel.data?.profileImgUrl,
            createdAt: userModel.data?.createdAt,
            updatedAt: userModel.data?.updatedAt));

    //store user data here
    locator<LocalStorage>().save(StorageDir.currentUserData, _currentUser);
  }

  void setCurrentUser(RegisteredUserResponse userModel) {
    _currentUser = currentUser.copyWith(
        data: UserData(
            id: userModel.data?.id,
            fullName: userModel.data?.fullName,
            isAdmin: userModel.data?.isAdmin,
            email: userModel.data?.email,
            phoneNumber: userModel.data?.phoneNumber,
            apiToken: userModel.data?.apiToken,
            apiTestToken: userModel.data?.apiTestToken,
            profileImg: userModel.data?.profileImg,
            deviceToken: userModel.data?.deviceToken,
            organizerName: userModel.data?.organizerImg,
            organizerInfo: userModel.data?.organizerInfo,
            organizerImg: userModel.data?.organizerImg,
            location: userModel.data?.location,
            emailVerifiedAt: userModel.data?.emailVerifiedAt,
            phoneVerifiedAt: userModel.data?.phoneVerifiedAt,
            profileImgUrl: userModel.data?.profileImgUrl,
            createdAt: userModel.data?.createdAt,
            updatedAt: userModel.data?.updatedAt, isVerified: '', passwordResetTime: null) );

    //store user data here
    locator<LocalStorage>().save(StorageDir.currentUserData, _currentUser);
  }

  // void setCustomerData(FetchCustomerDataResponseModel userModel) {
  //   _currentUser = currentUser.copyWith(
  //       data: Data().copyWith(
  //         customer: Customer().copyWith(
  //           id: userModel.id,
  //           phoneNumber: userModel.phoneNumber,
  //           accountNumber: userModel.accountNumber,
  //           lastName: userModel.lastName,
  //           otherNames: userModel.otherNames,
  //           email: userModel.email,
  //           accessLevel: userModel.accessLevel,
  //           updatedAt: userModel.updatedAt,
  //           createdAt: userModel.createdAt,
  //
  //         ),
  //       ));
  // }

  LoginResponseModel get currentUser => _currentUser;

  int? get userId => currentUser.data?.id;
}
