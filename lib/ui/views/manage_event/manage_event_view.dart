import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tickvent/ui/common/sizer.dart';
import 'package:tickvent/ui/component/text_widget.dart';
import '../../common/app_colors.dart';
import '../../common/app_strings.dart';
import '../../common/ui_helpers.dart';
import '../attendee_splash_screen.dart';
import '../host_splash_screen.dart';
import '../landing_page/host_landing_page.dart';
import '../landing_page/landing_page.dart';
import 'manage_event_viewmodel.dart';

class ManageEventView extends StackedView<ManageEventViewModel> {
  const ManageEventView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ManageEventViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcWhite,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/profile.png"),
                      horizontalSpaceSmall,
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hello,",
                              style:
                                  TextStyle(fontSize: 15, color: kcLightGrey)),
                          Text("Olamide",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("Switch to Attendee",
                          style: TextStyle(fontSize: 12, color: kcLightGrey)),
                      Transform.scale(
                        scale: 0.7,
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
                      SvgPicture.asset("assets/images/bell.svg"),
                    ],
                  )
                ],
              ),
              30.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/calendar.svg",
                          width: 20,
                          height: 20,
                        ),
                        const Text("Friday, June 6th",
                            style: TextStyle(
                                fontSize: 15,
                                color: kcPrimaryColor,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(width: 8),
                        SvgPicture.asset(
                          "assets/images/clock.svg",
                          width: 20,
                          height: 20,
                        ),
                        const Text("5:00pm",
                            style: TextStyle(
                                fontSize: 15,
                                color: kcPrimaryColor,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
              Text("Calabar Carnival 2024",
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold)),
              30.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 190.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: kcLightGrey, // Border color
                          width: 1.w, // Border width
                        ),
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Interested ",
                              style: TextStyle(color: kcPrimaryColor),
                            ),
                            SvgPicture.asset("assets/images/heart.svg")
                          ],
                        ),
                        5.height,
                        Row(
                          children: [
                            Text(
                              "105",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18.sp),
                            )
                          ],
                        )
                      ]),
                    ),
                  ),
                  Container(
                    width: 190.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: kcLightGrey, // Border color
                          width: 1.w, // Border width
                        ),
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ticket bought",
                              style: TextStyle(color: kcPrimaryColor),
                            ),
                            SvgPicture.asset("assets/images/ticket_bought.svg")
                          ],
                        ),
                        5.height,
                        Row(
                          children: [
                            Text(
                              "2,500",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18.sp),
                            )
                          ],
                        )
                      ]),
                    ),
                  ),
                ],
              ),
              30.height,
              Container(
                width: MediaQuery.of(context).size.width,
                height: 90.h,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: kcLightGrey, // Border color
                      width: 1.w, // Border width
                    ),
                    borderRadius: BorderRadius.circular(12.r)),
                child: Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Create new event ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                Container(
                                    child: Text(
                                  "Host another event as you prepare for\nthis one.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp),
                                )),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 110.w,
                                  height: 45.h,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: kcPrimaryColor, // Border color
                                        width: 1.w, // Border width
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(17.r)),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.sp),
                                      child: Text("Create Event"),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ]),
                ),
              ),
              20.height,
              Container(
                height: 200.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Container(
                          height: 179.3.h,
                          width: 230.3.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11.9.r),
                            image: DecorationImage(
                              image: AssetImage("assets/images/event_image1.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset("assets/images/edit_image.svg"),
                                    SvgPicture.asset("assets/images/delete_image.svg")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              20.height,
              Container(
                height: 520.h,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 1,
                    ),
                    itemCount: 4, // 4 boxes
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kcLightGrey, // Border color
                            width: 1.w, // Border width
                          ),
                          borderRadius:
                              BorderRadius.circular(15.0), // Rounded corners
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10.w, top: 10.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 100.w,
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: kcLightGrey, // Border color
                                          width: 1.w, // Border width
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                        color: const Color(0xffEAECF0)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          viewModel.eventStatus[index],
                                        ),
                                        5.width,
                                        SvgPicture.asset(
                                          "assets/more-circle.svg",
                                          height: 25.h,
                                          width: 25.w,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            50.height,
                            Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Row(
                                children: [
                                  TextWidget(
                                    viewModel.eventRole[index],
                                    style: TextStyle(
                                        color: const Color(0xff667085),
                                        fontSize: 16.sp),
                                  )
                                ],
                              ),
                            ),
                            2.height,
                            Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text(
                                      textAlign: TextAlign.justify,
                                      viewModel.eventStatus[index],
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  @override
  ManageEventViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ManageEventViewModel();
}
