import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:tickvent/app/app.router.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import 'host_event_viewmodel.dart';

class HostEventView extends StackedView<HostEventViewModel> {
  const HostEventView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HostEventViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset("assets/bell.svg"),
              ],
            ),
            verticalSpaceMedium,
            Text("Host Event",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            verticalSpaceMedium,
            Text("What type of event is this?",
                style: TextStyle(
                  color: Colors.grey,
                )),
            verticalSpaceMedium,
            Container(
              height: MediaQuery.of(context).size.height * 0.23,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffFCE7F6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    verticalSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Virtual Event",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                        SvgPicture.asset("assets/video.svg"),
                      ],
                    ),
                    verticalSpaceSmall,
                    Text(
                        "Host an online gathering! Perfect for webinars, workshops, or catching up with people anywhere in the world.",
                        style: TextStyle(fontSize: 13, color: Colors.grey)),
                    verticalSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            viewModel.navigationService
                                .navigateToCreateEventView();
                          },
                          child: Container(
                            height: 35,
                            width: 140,
                            decoration: BoxDecoration(
                                color: const Color(0xffEE46BC),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: const Text(
                                "Host Virtual Event",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: kcWhite),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            verticalSpaceMedium,
            GestureDetector(
              onTap: () {
                viewModel.navigationService.navigateToCreateEventView();
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.23,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffE0F2FE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      verticalSpaceSmall,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Physical Event",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                          SvgPicture.asset("assets/routing.svg"),
                        ],
                      ),
                      verticalSpaceSmall,
                      const Text(
                          "Plan an in-person experience! Great for conferences, meetups, or parties where face-to-face connection is key.",
                          style: TextStyle(fontSize: 13, color: Colors.grey)),
                      verticalSpaceSmall,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 35,
                            width: 140,
                            decoration: BoxDecoration(
                                color: const Color(0xff175CD3),
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                              child: Text(
                                "Host Physical Event",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: kcWhite),
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
          ],
        ),
      ),
    );
  }

  @override
  HostEventViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HostEventViewModel();
}
