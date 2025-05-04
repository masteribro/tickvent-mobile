import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';
import 'package:tickvent/app/app.router.dart';
import 'package:tickvent/services/user_service.dart';
import 'package:tickvent/ui/common/app_colors.dart';
import 'package:tickvent/ui/common/ui_helpers.dart';
import 'package:tickvent/ui/views/host_splash_screen.dart';

import '../../../app/app.locator.dart';
import '../../../models/create_passcode_request.dart';
import '../../common/app_strings.dart';
import '../../common/local_storage.dart';
import '../../common/storage_dir.dart';
import '../../component/submit_button.dart';
import '../attendee_splash_screen.dart';
import '../landing_page/host_landing_page.dart';
import '../landing_page/landing_page.dart';
import '../sign_in/sign_in_viewmodel.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    viewModel.context = context;
    return Scaffold(
      backgroundColor: kcWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/profile.png"),
                        horizontalSpaceSmall,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text("Hello,",
                            //     style: TextStyle(
                            //         fontSize: 15, color: kcLightGrey)),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Text( locator<UserService>().currentUser.data?.email ?? viewModel.user?.data?.email ?? viewModel.email ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  style:  TextStyle(
                                      fontSize: 15.sp, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                         Text("Switch to host",
                            style: TextStyle(fontSize: 12.sp, color: kcLightGrey)),
                        Transform.scale(
                          scale: 0.6,
                          child: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              isSwitched = value;
                              if (value) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HostSplashScreen(),
                                  ),
                                );
                              } else {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AttendeeSplashScreen()),
                                );
                              }
                              viewModel.notifyListeners();
                            },
                          ),
                        ),
                        SvgPicture.asset("assets/bell.svg",
                          width: 30.sp,
                        ),
                      ],
                    )
                  ],
                ),
                verticalSpaceMedium,
                Align(
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset(
                    "assets/loginLogo.svg",
                    height: 150,
                    width: 150,
                  ),
                ),
                verticalSpaceSmall,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("You don't have any\nupcoming event.",
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
                ),
                verticalSpaceSmall,
                GestureDetector(
                  onTap: () {
                    viewModel.navigationService.navigateToHostEventView();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: kcPrimaryColor),
                    ),
                    child: const Center(
                        child: Text("Host your own event",
                            style: TextStyle(
                                fontSize: 12, color: kcPrimaryColor))),
                  ),
                ),
                verticalSpaceMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Featured events",
                        style: TextStyle(fontSize: 14, color: kcLightGrey)),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                        color: kcPrimaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text("More Events",
                            style: TextStyle(fontSize: 12, color: kcWhite)),
                      ),
                    ),
                  ],
                ),
                verticalSpaceMedium,
                viewModel.events != null &&
                viewModel.events!.length > 0?
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.42,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: viewModel.events?.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Two columns
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio:
                            0.7, // Adjusts item height relative to width
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            viewModel.goToViewTicketView();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: kcPrimaryColor.withOpacity(0.2),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      15), // Rounded on all corners
                                  child: Image.asset(
                                    "assets/carnival.png",
                                    height: MediaQuery.of(context).size.height *
                                        0.18, // Half of the container's height
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                verticalSpaceSmall,
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Abuja Music Concert",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset("assets/calendar.svg"),
                                      const Text("Friday, June 6th",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: kcPrimaryColor,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(width: 5),
                                      SvgPicture.asset("assets/clock.svg"),
                                      const Text("5:00pm",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: kcPrimaryColor,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on,
                                          size: 10, color: kcLightGrey),
                                      SizedBox(width: 1),
                                      Text("National Stadium, Abuja",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset("assets/ticket.svg"),
                                      const SizedBox(width: 2),
                                      const Text("FREE",
                                          style: TextStyle(
                                              color: kcPrimaryColor,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ): Container(
                  height: 400.h,
                  child: Center(
                    child: Column(
                      children: [
                        SvgPicture.asset("assets/empty_calendar_icon.svg"),
                        Text("No Event yet",
                          style: TextStyle(fontSize: 20.sp,
                          fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  Future<void> onViewModelReady(HomeViewModel viewModel) async {
    viewModel.getFeaturedEvent();
    viewModel.email = await locator<LocalStorage>().fetch(StorageDir.userEmail);
    viewModel.user = await locator<LocalStorage>().fetch(StorageDir.currentUserData,);
    bool passCode = await viewModel.checkPasscodeStatus(locator<UserService>().currentUser.data?.email ?? viewModel.user?.data?.email ?? viewModel.email ?? "");
    debugPrint("Does the user have passcode: $passCode");
    if (passCode == false) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 300), () {
          if (viewModel.context.mounted && ModalRoute.of(viewModel.context)?.isCurrent == true) {
            _showInputBottomSheet(viewModel.context, viewModel);
          }
        });
      });
    }
    viewModel.notifyListeners();
  }


  void _showInputBottomSheet(context, HomeViewModel viewModel,) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Set Your Passcode',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Pinput(
                length: 6,
                controller: viewModel.passCodeController,
                onChanged: (s) {
                  setState(() {
                    viewModel.passCode = s;
                    debugPrint("passcode: ${viewModel.passCode}");
                  });
                },
              ),
              const SizedBox(height: 16),
              SubmitButton(
                  label: "Continue",
                  isLoading: viewModel.isBusy,
                  onTap: () {
                    if (viewModel.passCode?.length == 6) {
                      viewModel.setPassCode(
                          CreatePasscodeRequest(
                              email: locator<UserService>().currentUser.data?.email ?? viewModel.user?.data?.email ?? viewModel.email ??"",
                              isMobile: true,
                              passcode: int.parse(viewModel.passCode!),
                              passcodeConfirmation: int.parse(viewModel.passCodeController.text)),
                          context);
                    } else {
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter a passcode')),
          );
          }
          },
                  ),
              const SizedBox(height: 24),
            ],
          ),
        );}
      ),
    );
  }
}
