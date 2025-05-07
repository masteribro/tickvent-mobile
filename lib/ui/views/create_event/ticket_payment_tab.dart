import 'package:flutter/cupertino.dart';

import 'create_event_viewmodel.dart';

class TicketPaymentTab extends StatefulWidget {
  const TicketPaymentTab({super.key, required this.viewModel});
  final CreateEventViewModel viewModel;
  @override
  State<TicketPaymentTab> createState() => _TicketPaymentTabState();
}

class _TicketPaymentTabState extends State<TicketPaymentTab> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
