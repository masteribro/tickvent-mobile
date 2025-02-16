import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../../common/ui_helpers.dart';
import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset("assets/bell.svg"),
                  ],
                ),
                verticalSpaceMedium,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Settings",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                verticalSpaceMedium,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          color: Color(0xffF3F4F6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset("assets/profile.png"),
                                    horizontalSpaceSmall,
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ]),
                              verticalSpaceMedium,
                              const Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("John Hillary Doe",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Your profile Information",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black54),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          color: Color(0xffF3F4F6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset("assets/bank.svg"),
                                    horizontalSpaceSmall,
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ]),
                              verticalSpaceMedium,
                              const Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Bank Details",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Set up how we pay you",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black54),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                verticalSpaceSmall,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          color: Color(0xffF3F4F6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset("assets/ticket.svg",
                                        color: Colors.black54,
                                        height: 30,
                                        width: 30),
                                    horizontalSpaceSmall,
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ]),
                              verticalSpaceMedium,
                              const Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Event Host Settings",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Your event page profile",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black54),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          color: Color(0xffF3F4F6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(
                                        "assets/shield-security.svg"),
                                    horizontalSpaceSmall,
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ]),
                              verticalSpaceMedium,
                              const Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Security Settings",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Secure your account",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black54),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                verticalSpaceSmall,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          color: Color(0xffF3F4F6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(
                                        "assets/direct-notification.svg"),
                                    horizontalSpaceSmall,
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ]),
                              verticalSpaceMedium,
                              const Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Notifications",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Adjust how you receive notifications",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black54),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          color: Color(0xffF3F4F6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset("assets/star.svg"),
                                    horizontalSpaceSmall,
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ]),
                              verticalSpaceMedium,
                              const Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Feedback",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Tell us how we can make your experience better",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black54),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                verticalSpaceSmall,
                Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.92,
                      decoration: BoxDecoration(
                        color: Color(0xffF3F4F6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset("assets/headphone.svg"),
                                  horizontalSpaceSmall,
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ]),
                            verticalSpaceMedium,
                            const Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Support",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Having issues? let us know\nhere",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black54),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();
}
