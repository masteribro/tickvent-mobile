import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tickvent/ui/component/text_widget.dart';

import '../common/app_colors.dart';
import 'landing_page/host_landing_page.dart';
import 'landing_page/landing_page.dart';

class AttendeeSplashScreen extends StatefulWidget {
  const AttendeeSplashScreen({super.key});

  @override
  State<AttendeeSplashScreen> createState() => _AttendeeSplashScreenState();
}

class _AttendeeSplashScreenState extends State<AttendeeSplashScreen> {
  @override
  void initState() {
    switchToHost(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: TextWidget(
              "Attendee",
              fontSize: 30.sp,
              color: kcWhite,
              weight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }

  Future<void> switchToHost(context) async {
    Future.delayed(const Duration(seconds: 5)).then((s) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LandingPageManager(),
        ),
      );
    });
  }
}
