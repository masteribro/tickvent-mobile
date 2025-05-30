import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickvent/ui/views/explore/explore_view.dart';
import 'package:tickvent/ui/views/home/home_view.dart';
import 'package:tickvent/ui/views/settings/settings_view.dart';
import 'package:tickvent/ui/views/ticket/ticket_view.dart';

import '../../common/app_colors.dart';
import '../host_event/host_event_view.dart';
import '../manage_event/manage_event_view.dart';

class HostLandingPageManager extends StatefulWidget {
  const HostLandingPageManager({
    Key? key,
  }) : super(key: key);
  @override
  State<HostLandingPageManager> createState() => _HostLandingPageManagerState();
}

class _HostLandingPageManagerState extends State<HostLandingPageManager> {
  int selectedIndex = 2;
  double bottomNavBarHeight = 60;

  late List<Widget?> _listPage;

  @override
  void initState() {
    super.initState();
    // selectedIndex = widget.pageNum ?? 2;
    _listPage = <Widget?>[
      const HomeView(),
      const ExploreView(),
      const ManageEventView(),
      const TicketView(),
      const SettingsView(),
    ];
  }

  Widget _buildOriginDesign() {
    return CustomNavigationBar(
      iconSize: 20,
      selectedColor: Theme.of(context).primaryColor,
      strokeColor: kcPrimaryColor,
      unSelectedColor: kcWhite,
      backgroundColor: kcWhite,
      items: [
        CustomNavigationBarItem(
          title: Text("Home",
              style: TextStyle(
                  fontSize: 11,
                  color: selectedIndex == 0 ? kcPrimaryColor : kcLightGrey)),
          icon: SvgPicture.asset(
            'assets/images/home.svg',
            color: selectedIndex == 0 ? kcPrimaryColor : kcLightGrey,
          ),
        ),
        CustomNavigationBarItem(
            title: Text("Explore",
                style: TextStyle(
                  fontSize: 11,
                  color: selectedIndex == 1 ? kcPrimaryColor : kcLightGrey,
                )),
            icon: SvgPicture.asset('assets/images/location.svg',
                color: selectedIndex == 1 ? kcPrimaryColor : kcLightGrey)),
        CustomNavigationBarItem(
            title: Text("Manage Event",
                style: TextStyle(
                  fontSize: 11,
                  color: selectedIndex == 2 ? kcPrimaryColor : kcLightGrey,
                )),
            icon: SvgPicture.asset('assets/images/manage_event.svg',
                color: selectedIndex == 2 ? kcPrimaryColor : kcLightGrey)),
        CustomNavigationBarItem(
          title: Text("Ticket",
              style: TextStyle(
                fontSize: 11,
                color: selectedIndex == 3 ? kcPrimaryColor : kcLightGrey,
              )),
          icon: SvgPicture.asset('assets/images/ticket-star.svg',
              color: selectedIndex == 3 ? kcPrimaryColor : kcLightGrey),
        ),
        CustomNavigationBarItem(
          title: Text(
            "Settings",
            style: TextStyle(
              fontSize: 11,
              color: selectedIndex == 4 ? kcPrimaryColor : kcLightGrey,
            ),
          ),
          icon: SvgPicture.asset('assets/images/setting-2.svg',
              color: selectedIndex == 4 ? kcPrimaryColor : kcLightGrey),
        ),
      ].whereType<CustomNavigationBarItem>().toList(), // Remove null values
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewPadding = MediaQuery.of(context).viewPadding;
    double barHeight;
    double barHeightWithNotch = 67;
    double arcHeightWithNotch = 67;

    if (size.height > 800) {
      barHeight = 40;
    } else {
      barHeight = size.height * 0.11;
    }

    if (viewPadding.bottom > 0) {
      barHeightWithNotch = (size.height * 0.07) + viewPadding.bottom;
      arcHeightWithNotch = (size.height * 0.075) + viewPadding.bottom;
    }

    return Scaffold(
      backgroundColor: kcWhite,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
            child: bodyContainer(),
          ),
          Align(alignment: Alignment.bottomCenter, child: _buildOriginDesign())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    Color? selectedColor = kcPrimaryColor;
    Widget? page = _listPage[selectedIndex];

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: selectedColor,
      child: Center(
        child: page,
      ),
    );
  }
}
