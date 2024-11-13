import 'package:flutter/cupertino.dart';

import '../../../common/app_colors.dart';

class EventType extends StatelessWidget {
  const EventType({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
            color: kcPrimaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Center(
                child: Text(
              title,
              style: TextStyle(
                  color: kcDarkGreyColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            )),
          )),
    );
  }
}
