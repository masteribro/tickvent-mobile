import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:tickvent/ui/common/app_colors.dart';

import '../../common/ui_helpers.dart';
import 'ticket_viewmodel.dart';

class TicketView extends StackedView<TicketViewModel> {
  const TicketView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TicketViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
                const Text("Booked Events",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: viewModel.ticketList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            viewModel.goToViewTicketView();
                          },
                          child: Container(
                            height: 155,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage(viewModel.ticketList[index])),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Calabar Carnival 2024',
                                    style: TextStyle(
                                        color: kcWhite,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 70,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/calendar.svg",
                                        color: kcWhite,
                                        width: 15,
                                        height: 15,
                                      ),
                                      SizedBox(width: 2),
                                      const Text("Friday, June 6th",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: kcWhite,
                                          )),
                                      const SizedBox(width: 5),
                                      SvgPicture.asset(
                                        "assets/clock.svg",
                                        color: kcWhite,
                                      ),
                                      SizedBox(width: 2),
                                      const Text("5:00pm",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: kcWhite,
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 1,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on,
                                          size: 20, color: kcWhite),
                                      SizedBox(width: 1),
                                      Text("National Stadium, Abuja",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: kcWhite,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  TicketViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TicketViewModel();
}
