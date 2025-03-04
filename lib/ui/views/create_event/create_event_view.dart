import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:tickvent/ui/common/app_colors.dart';

import 'create_event_viewmodel.dart';

class CreateEventView extends StackedView<CreateEventViewModel> {
  const CreateEventView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CreateEventViewModel viewModel,
    Widget? child,
  ) {
    return  Scaffold(
      backgroundColor: kcWhite,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset("assets/bell.svg"),
                ],
              ),
        
            ],
          ),
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
