import 'package:flutter/cupertino.dart';

import 'create_event_viewmodel.dart';

class OrganizerInfoTab extends StatefulWidget {
  const OrganizerInfoTab({super.key, required this.viewModel});
  final CreateEventViewModel viewModel;
  @override
  State<OrganizerInfoTab> createState() => _OrganizerInfoTabState();
}

class _OrganizerInfoTabState extends State<OrganizerInfoTab> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
