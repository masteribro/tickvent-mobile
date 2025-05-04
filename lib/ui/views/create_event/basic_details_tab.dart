import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tickvent/ui/common/app_colors.dart';
import 'package:tickvent/ui/common/sizer.dart';
import 'package:tickvent/ui/common/text_field.dart';

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
    'Hybrid Event',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              color: kcPrimaryColor.withOpacity(0.1)
            ),
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
          )
        ],
      ),
    );
  }
}
