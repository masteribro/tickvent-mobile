import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:tickvent/ui/views/featured_event/ticket_page.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../../component/text_field_widget.dart';
import 'featured_event_viewmodel.dart';

class FeaturedEventView extends StackedView<FeaturedEventViewModel> {
  const FeaturedEventView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FeaturedEventViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcWhite,
      floatingActionButton:   Padding(
        padding: EdgeInsets.only(left: 30, ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width * 0.38,
              decoration: BoxDecoration(
                color: kcPrimaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/ticket.svg", color: kcWhite,),
                      horizontalSpaceSmall,
                      Text("Get Ticket",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: kcWhite)),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width * 0.34,
              decoration: BoxDecoration(
                color: kcWhite,
                border: Border.all(
                  color: kcPrimaryColor,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child:  Center(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/interested.svg"),
                      horizontalSpaceTiny,
                      Text("Interested",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: kcPrimaryColor)),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                showEventOptions(context);
              },
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.17,
                decoration: BoxDecoration(
                  color: kcWhite,
                  border: Border.all(
                    color: kcPrimaryColor,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                          Border.all(color: kcPrimaryColor, width: 1.5)),
                    ),
                    SizedBox(width: 2),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                          Border.all(color: kcPrimaryColor, width: 1.5)),
                    ),
                    SizedBox(width: 2),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                          Border.all(color: kcPrimaryColor, width: 1.5)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/carnivalImage.jpg")),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              viewModel.goBack();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: kcDarkGreyColor,
                              weight: 60,
                            )),
                        SvgPicture.asset("assets/bell.svg"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            verticalSpaceSmall,
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
                        "assets/clock.svg",
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(
              "Event by Calabar Council",
              style: TextStyle(color: kcLightGrey, fontSize: 12),
            ),
            verticalSpaceSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    viewModel.navigationService.navigateToView(TicketPage());
                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.38,
                    decoration: BoxDecoration(
                      color: kcPrimaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/ticket.svg", color: kcWhite,),
                            horizontalSpaceSmall,
                            Text("Get Ticket",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: kcWhite)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.34,
                  decoration: BoxDecoration(
                    color: kcWhite,
                    border: Border.all(
                      color: kcPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:  Center(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/interested.svg"),
                          horizontalSpaceTiny,
                          Text("Interested",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: kcPrimaryColor)),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    showEventOptions(context);
                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.17,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kcPrimaryColor,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                              Border.all(color: kcPrimaryColor, width: 1.5)),
                        ),
                        SizedBox(width: 2),
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                              Border.all(color: kcPrimaryColor, width: 1.5)),
                        ),
                        SizedBox(width: 2),
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                              Border.all(color: kcPrimaryColor, width: 1.5)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // verticalSpaceSmall,
            // Padding(
            //   padding: EdgeInsets.only(left: 20, right: 20),
            //   child: Container(
            //     height: 70,
            //     child: DottedBorder(
            //       color: Colors.purple, // Change to your desired color
            //       strokeWidth: 1.5,
            //       dashPattern: [5, 5], // Length and space of dashes
            //       child: const Padding(
            //         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text("3 Invites sent",
            //                     style: TextStyle(
            //                         fontSize: 14, color: Colors.grey)),
            //                 Text("VIP Table for 5",
            //                     style: TextStyle(
            //                         fontSize: 18, fontWeight: FontWeight.bold)),
            //               ],
            //             ),
            //             Text("₦100,000",
            //                 style: TextStyle(
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.green)),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            verticalSpaceSmall,
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  SvgPicture.asset("assets/locationIcon.svg"),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Constitution Ave, Kukwaba, Abuja 900211, Federal Capital \nTerritory",
                    style: TextStyle(color: Colors.grey, fontSize: 11),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  SvgPicture.asset("assets/heart-circle.svg"),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "12.6k going, 204 interested",
                    style: TextStyle(color: Colors.grey, fontSize: 11),
                  )
                ],
              ),
            ),
            verticalSpaceSmall,
            const Divider(),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Regular",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "VIP Table",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/ticket.svg",
                          color: Colors.grey,
                          width: 25,
                          height: 25,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "N30,000",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/ticket.svg",
                          color: Colors.grey,
                          width: 25,
                          height: 25,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "N100,000",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Per person",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "5 per table",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpaceSmall,
            const Divider(),
            verticalSpaceSmall,
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "What to expect",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
            verticalSpaceSmall,
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: const Text(
                '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
            ''',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            verticalSpaceSmall,
            const Divider(),
            verticalSpaceSmall,
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Meet your host",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
            verticalSpaceSmall,
            Image.asset(
              "assets/host.png",
              height: 200,
              width: 200,
            ),
            verticalSpaceSmall,
            const Text(
              "Calabar Council",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            const Text(
              "14 past events",
              style: TextStyle(color: Colors.grey),
            ),
            verticalSpaceSmall,
            const Divider(),
            verticalSpaceSmall,
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: const Text(
                '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
            ''',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            verticalSpaceMedium,
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Suggested events",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("See more",
                      style: TextStyle(fontSize: 14, color: kcPrimaryColor)),
                ],
              ),
            ),
            verticalSpaceSmall,
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: GridView.builder(
                shrinkWrap:
                true, // Makes GridView take only the necessary space
                physics:
                const NeverScrollableScrollPhysics(), // Prevents GridView from being scrollable
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 0.9,
                ),
                itemCount: 2, // Adjust the item count as needed
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height:
                    MediaQuery.of(context).size.height * 0.3,
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
                            MediaQuery.of(context).size.height * 0.13,
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
                },
                padding: EdgeInsets.all(8.0),
              ),
            ),
            verticalSpaceLarge,
            verticalSpaceLarge,
          ],
        ),
      ),
    );

  }

  void showEventOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0, top: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 7,
                    width: MediaQuery.of(context).size.width * 0.12,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(10) ,
                      color: kcLightGrey
                    ),
                  )
                ],
              ),
              buildOption(
                context,
                icon: Icons.person_add,
                label: 'Invite people',
              ),
              buildOption(
                context,
                icon: Icons.calendar_today,
                label: 'Add to calendar',
              ),
              buildOption(
                context,
                icon: Icons.bookmark_border,
                label: 'Save',
              ),
              buildOption(
                context,
                icon: Icons.link,
                label: 'Copy event link',
              ),
              buildOption(
                context,
                icon: Icons.report,
                label: 'Find support or report event',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildOption(BuildContext context, {required IconData icon, required String label}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(label, style: const TextStyle(fontSize: 16)),
      onTap: () {
        // Handle option tap here
        Navigator.pop(context);
      },
    );
  }


@override
  FeaturedEventViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FeaturedEventViewModel();
}
