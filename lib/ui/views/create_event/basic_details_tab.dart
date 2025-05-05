import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tickvent/ui/common/app_colors.dart';
import 'package:tickvent/ui/common/sizer.dart';
import 'package:tickvent/ui/common/text_field.dart';
import 'package:tickvent/ui/component/text_field_widget.dart';

class BasicDetailsTab extends StatefulWidget {
  const BasicDetailsTab({super.key});

  @override
  State<BasicDetailsTab> createState() => _BasicDetailsTabState();
}

class _BasicDetailsTabState extends State<BasicDetailsTab> {
  String? selectedEventType = 'Virtual Event';

  final List<String> eventTypes = [
    'Virtual Event',
    'Physical Event',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 120.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  color: kcPrimaryColor.withOpacity(0.1)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                  alignment: Alignment.centerLeft,
                        child: TextWidget(
                          "Event Type",
                          weight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: const Color(0xff667085),
                        ),
                      ),
                      10.height,
                      DropdownButtonFormField<String>(
                        value: selectedEventType,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        ),
                        icon: const Icon(Icons.arrow_drop_down),
                        items: eventTypes.map((type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedEventType = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
          
              20.height,
          
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    color: kcPrimaryColor.withOpacity(0.1)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextWidget(
                          "What's the name of this event?",
                          weight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: const Color(0xff667085),
                        ),
                      ),
                      10.height,
                      TextFieldWidget(controller: TextEditingController(), textInputType: TextInputType.text ),
                      10.height,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextWidget(
                          "What's this event about?",
                          weight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: const Color(0xff667085),
                        ),
                      ),
                      20.height,
                      TextFieldWidget(
                        contentPaddingV: 80.h,
                          maxLines: 5,
                          controller: TextEditingController(), textInputType: TextInputType.text ),
                      20.height,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextWidget(
                          "What type of event is this?",
                          weight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: const Color(0xff667085),
                        ),
                      ),
                      10.height,
                      Container(
                        height: 60.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.r)),
                            color: kcWhite
                        ),
                      ),
                      20.height,
                      Container(
                        height: 270.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index){
                          return  Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            child: DottedBorder(
                              color: Colors.grey.shade400,
                              strokeWidth: 1.5,
                              dashPattern: const [8, 5],
                              borderType: BorderType.RRect,
                              radius: Radius.circular(20.r),
                              child: Container(
                                color: kcWhite,
                                height: 270.h,
                                width: 200.w,
                                child:  Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset("assets/images/Image_selector.svg"),
                                    5.height,
                                    TextWidget("Select an image or video",
                                      color: kcPrimaryColor,
                                    weight: FontWeight.w600,
                                      fontSize: 14.sp,
                                    ),
                                    6.height,
                                    TextWidget("Maximum size: 50MB",
                                      color: kcMediumGrey,
                                      weight: FontWeight.w400,
                                      fontSize: 11.sp,
                                    )

                                  ],
                                ),

                              ),
                            ),
                          );
                        }),
                      ),
                      20.height,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextWidget(
                          "Select event date",
                          weight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: const Color(0xff667085),
                        ),
                      ),
                      10.height,
                      TextFieldWidget(controller: TextEditingController(), textInputType: TextInputType.text ),
                      20.height,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextWidget(
                          "Select time",
                          weight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: const Color(0xff667085),
                        ),
                      ),
                      10.height,
                      TextFieldWidget(controller: TextEditingController(), textInputType: TextInputType.text ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
