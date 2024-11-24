import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:tickvent/app/app.router.dart';
import 'package:tickvent/ui/common/app_colors.dart';
import 'package:tickvent/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
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
                        Image.asset("assets/profile.png"),                        horizontalSpaceSmall,
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hello,",
                                style: TextStyle(
                                    fontSize: 15, color: kcLightGrey)),
                            Text("Olamide",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        verticalSpaceSmall,
                        Text("Switch to host",
                            style: TextStyle(fontSize: 12, color: kcLightGrey)),
                        Transform.scale(
                          scale: 0.7,
                          child: Switch(
                            value: viewModel.isSwitched,
                            onChanged: (value) {
                              viewModel.isSwitched = value;
                              viewModel.notifyListeners();
                            },
                          ),
                        ),
                        SvgPicture.asset("assets/bell.svg"),
                      ],
                    ),
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
                            style:
                                TextStyle(fontSize: 12, color: kcPrimaryColor))),
                  ),
                ),
                verticalSpaceMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Featured events",
                        style: TextStyle(fontSize: 14, color: kcLightGrey)),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                        color: kcPrimaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text("More Events",
                            style: TextStyle(fontSize: 12, color: kcWhite)),
                      ),
                    ),
                  ],
                ),
                verticalSpaceMedium,
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.42,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Two columns
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio:
                            0.7, // Adjusts item height relative to width
                      ),
                      itemBuilder: (context, index) {
                        return Container(
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
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                              SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset("assets/calendar.svg"),
                                    const Text("Friday, June 6th",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: kcPrimaryColor,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 5),
                                    SvgPicture.asset("assets/clock.svg"),
                                    const Text("5:00pm",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: kcPrimaryColor,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
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
                        );
                      },
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
}
