import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:tickvent/app/app.router.dart';
import 'package:tickvent/ui/common/app_colors.dart';
import 'package:tickvent/ui/component/text_field_widget.dart';
import 'package:tickvent/ui/views/explore/widget/event_type.dart';

import '../../common/ui_helpers.dart';
import '../featured_event/featured_event_view.dart';
import 'explore_viewmodel.dart';

class ExploreView extends StackedView<ExploreViewModel> {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ExploreViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcWhite,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Discover Amazing Events",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SvgPicture.asset("assets/Iconbutton.svg"),
                  ],
                ),
                verticalSpaceMedium,
                TextFieldWidget(
                  controller: TextEditingController(),
                  hintText: "Search Events here...",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset("assets/trailingIcon.svg"),
                  ),
                  textInputType: TextInputType.text,
                ),
                verticalSpaceSmall,
                verticalSpaceSmall,
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.23,
                              decoration: BoxDecoration(
                                color: kcPrimaryColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          viewModel.categories[index]["icon"]),
                                      SizedBox(height: 1),
                                      Text(
                                        viewModel.categories[index]["title"],
                                      )
                                    ],
                                  ))),
                        );
                      }),
                ),
                verticalSpaceSmall,
                Divider(),
                verticalSpaceTiny,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      EventType(title: 'Free Events'),
                      EventType(title: 'Virtual Events'),
                      EventType(title: 'Physical Events'),
                      EventType(title: 'In my city'),
                      EventType(title: 'This weekend'),
                    ],
                  ),
                ),
                verticalSpaceTiny,
                Divider(),
                verticalSpaceTiny,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Featured Events",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Container(
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/info-circle.svg",
                              width: 20, height: 20),
                          horizontalSpaceTiny,
                          Text("Sponsored",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ],
                ),
                verticalSpaceSmall,
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.42,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            viewModel.navigationService
                                .navigateToFeaturedEventView();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.42,
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                color: kcPrimaryColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        15), // Rounded on all corners
                                    child: Image.asset(
                                      "assets/carnival.png",
                                      height: MediaQuery.of(context)
                                              .size
                                              .height *
                                          0.26, // Half of the container's height
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  verticalSpaceSmall,
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Abuja Music Concert",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: kcDarkGreyColor,
                                                fontWeight: FontWeight.bold)),
                                        Container(
                                          height: 35,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: kcPrimaryColor
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    "assets/ticket.svg"),
                                                horizontalSpaceTiny,
                                                Text(
                                                  "20,000",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset("assets/calendar.svg"),
                                        const Text("Friday, June 6th",
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: kcPrimaryColor,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(width: 5),
                                        SvgPicture.asset("assets/clock.svg"),
                                        const Text("5:00pm",
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: kcPrimaryColor,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.location_on,
                                            size: 14, color: kcLightGrey),
                                        SizedBox(width: 1),
                                        Text("National Stadium, Abuja",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                verticalSpaceSmall,
                Row(
                  children: [
                    Text("This weekend",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                verticalSpaceSmall,
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.42,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.42,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: kcPrimaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      15), // Rounded on all corners
                                  child: Image.asset(
                                    "assets/carnival.png",
                                    height: MediaQuery.of(context).size.height *
                                        0.26, // Half of the container's height
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                verticalSpaceSmall,
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Abuja Music Concert",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: kcDarkGreyColor,
                                              fontWeight: FontWeight.bold)),
                                      Container(
                                        height: 35,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color:
                                                kcPrimaryColor.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/ticket.svg"),
                                              horizontalSpaceTiny,
                                              Text(
                                                "20,000",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset("assets/calendar.svg"),
                                      const Text("Friday, June 6th",
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: kcPrimaryColor,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(width: 5),
                                      SvgPicture.asset("assets/clock.svg"),
                                      const Text("5:00pm",
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: kcPrimaryColor,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on,
                                          size: 14, color: kcLightGrey),
                                      SizedBox(width: 1),
                                      Text("National Stadium, Abuja",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400)),
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
                ),
                verticalSpaceSmall,
                Row(
                  children: [
                    Text("Upcoming Events",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                verticalSpaceSmall,
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Wrap(
                      spacing: 8.0, // Space between items horizontally
                      runSpacing: 8.0, // Space between rows
                      children: List.generate(5, (index) {
                        return Container(
                          width: (MediaQuery.of(context).size.width - 24) /
                              2, // Width for 2 items per row with spacing
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kcPrimaryColor.withOpacity(0.2),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  "assets/carnival.png",
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              verticalSpaceTiny,
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Abuja Music Concert",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 2),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset("assets/calendar.svg"),
                                    const Text(
                                      "Friday, June 6th",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: kcPrimaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    SvgPicture.asset("assets/clock.svg"),
                                    const Text(
                                      "5:00pm",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: kcPrimaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 2),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on,
                                        size: 10, color: kcLightGrey),
                                    SizedBox(width: 1),
                                    Text(
                                      "National Stadium, Abuja",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 4),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset("assets/ticket.svg"),
                                    const SizedBox(width: 2),
                                    const Text(
                                      "FREE",
                                      style: TextStyle(
                                        color: kcPrimaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
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
  ExploreViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ExploreViewModel();
}
