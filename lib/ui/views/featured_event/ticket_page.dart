import 'package:flutter/material.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  int regularQuantity = 1;
  int vipQuantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Ticket'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEventDetails(),
            const SizedBox(height: 24),
            _buildTicketOption(
              title: 'Regular',
              price: 'N30,000',
              description: 'Per seat',
              quantity: regularQuantity,
              onIncrement: () => setState(() => regularQuantity++),
              onDecrement: () => setState(() => regularQuantity = regularQuantity > 0 ? regularQuantity - 1 : 0),
              color: Colors.blue,
            ),
            const SizedBox(height: 16),
            _buildTicketOption(
              title: 'VIP',
              price: 'N100,000',
              description: 'Table of 5',
              quantity: vipQuantity,
              onIncrement: () => setState(() => vipQuantity++),
              onDecrement: () => setState(() => vipQuantity = vipQuantity > 0 ? vipQuantity - 1 : 0),
              color: Colors.amber,
            ),
            const SizedBox(height: 32),
            _buildPayButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildEventDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Chip(
          label: Text('Virtual Event'),
          backgroundColor: Colors.grey,
        ),
        const SizedBox(height: 8),
        const Text(
          'Fri, June 6th  05:00 pm',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Calabar Music Festival',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        const Text(
          'Event by Calabar Council',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 16),
         Row(
          children: [
            Icon(Icons.location_on, size: 16),
            SizedBox(width: 4),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                'Constitution Ave, Kukwaba, Abuja 90021, Federal Capital Territory',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Row(
          children: [
            Icon(Icons.people, size: 16),
            SizedBox(width: 4),
            Text(
              '12.6k going, 204 interested',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTicketOption({
    required String title,
    required String price,
    required String description,
    required int quantity,
    required Function() onIncrement,
    required Function() onDecrement,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(description),
                    const SizedBox(height: 4),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: onDecrement,
                      ),
                      Text(quantity.toString()),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: onIncrement,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPayButton() {
    final total = (regularQuantity * 30000) + (vipQuantity * 100000);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.blue,
        ),
        onPressed: () {},
        child: Text(
          'Pay now - N${total.toStringAsFixed(0)}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}