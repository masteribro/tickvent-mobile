import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';
import 'package:tickvent/app/app.router.dart';
import 'package:tickvent/ui/common/app_colors.dart';
import 'package:tickvent/ui/common/sizer.dart';
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
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: PageView(
                  controller: viewModel.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ),
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
                            isLoading: viewModel.isBusy,
                            onTap: () {
                              viewModel.createAccount(
                                  viewModel.emailController.text);
                            },
                          ),
                          5.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Do you have an account?",
                                style: TextStyle(color: Colors.grey),
                              ),
                              InkWell(
                                onTap: () {
                                  viewModel.pageController.jumpToPage(2);
                                },
                                child: const Text(
                                  " Login",
                                  style: TextStyle(color: kcPrimaryColor),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
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
                              isLoading: viewModel.isBusy,
                              onTap: () {
                                viewModel.sendOtp(
                                    viewModel.emailController.text,
                                    int.parse(viewModel.pinController.text));
                              }),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Log In",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
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
                              viewModel.pageController.nextPage(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeIn);
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Login with your passcode",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          verticalSpaceSmall,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Enter your passcode",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          verticalSpaceMedium,
                          Pinput(
                            length: 6,
                            controller: viewModel.passCodeController,
                          ),
                          verticalSpaceMedium,
                          SubmitButton(
                              label: "Continue",
                              isLoading: viewModel.isBusy,
                              onTap: () {
                                viewModel.login(
                                    viewModel.emailController.text,
                                    int.parse(
                                        viewModel.passCodeController.text));
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
