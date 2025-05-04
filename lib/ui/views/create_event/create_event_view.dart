import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:tickvent/ui/common/app_colors.dart';
import 'package:tickvent/ui/common/sizer.dart';
import 'package:tickvent/ui/common/text_field.dart';
import 'package:tickvent/ui/views/create_event/ticket_payment_tab.dart';

import 'basic_details_tab.dart';
import 'create_event_viewmodel.dart';
import 'organizer_info_tab.dart';

class CreateEventView extends StackedView<CreateEventViewModel> {
  const CreateEventView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CreateEventViewModel viewModel,
    Widget? child,
  ) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: kcWhite,
        appBar: AppBar(
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                      children: [
                        TextWidget("Host Event", fontSize: 22.sp, weight: FontWeight.w600,)
                      ],
                    ),
                  SvgPicture.asset("assets/bell.svg"),
                ],
              ),
            ],
          ),
          bottom: const TabBar(
            labelColor: kcPrimaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: kcPrimaryColor,
            tabs: [
              Tab(text: 'Basic Details'),
              Tab(text: 'Organizer Info'),
              Tab(text: 'Ticket & Payment'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BasicDetailsTab(),
            OrganizerInfoTab(),
            TicketPaymentTab(),
          ],
        ),

      ),
    );
  }

  @override
  CreateEventViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateEventViewModel();
}
