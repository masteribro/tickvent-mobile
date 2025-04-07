import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';
import 'package:tickvent/app/app.router.dart';
import 'package:tickvent/ui/views/landing_page/landing_page.dart';

import '../../common/ui_helpers.dart';
import '../../component/submit_button.dart';
import '../../component/text_field_widget.dart';
import 'sign_in_viewmodel.dart';

class SignInView extends StackedView<SignInViewModel> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignInViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpaceMedium,
              SvgPicture.asset("assets/loginLogo.svg"),
              const Row(
                children: [
                  Text(
                    "Log In or Sign Up",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: PageView(
                  controller: viewModel.pageController,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          verticalSpaceSmall,
                          const Text(
                            "Enter your email address and we will send you a verification code",
                            style: TextStyle(color: Colors.grey),
                          ),
                          verticalSpaceMedium,
                          const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Your email address",
                                style: TextStyle(color: Colors.grey),
                              )),
                          verticalSpaceSmall,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: TextFieldWidget(
                              controller: viewModel.emailController,
                              hintText: "Enter your email address",
                              textInputType: TextInputType.emailAddress,
                            ),
                          ),
                          verticalSpaceMedium,
                          SubmitButton(
                            label: "Continue",
                            onTap: () {
                              viewModel.createAccount(
                                  viewModel.emailController.text);
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpaceSmall,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Enter the verification code we sent to your mail",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          verticalSpaceMedium,
                          Pinput(
                            length: 6,
                            controller: viewModel.pinController,
                          ),
                          verticalSpaceMedium,
                          SubmitButton(
                              label: "Continue",
                              onTap: () {
                                viewModel.navigationService
                                    .navigateToView(LandingPageManager());
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SignInViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignInViewModel();
}
