import 'package:flutter/material.dart';

class NotificationItem {
  final String title;
  final String body;
  final bool isError;

  const NotificationItem({
    required this.title,
    required this.body,
    required this.isError,
  });
}

class NotificationCard extends StatelessWidget {
  final NotificationItem item;

  const NotificationCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),

                  if (item.body.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        item.body,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF757575),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  static String id = "note_page";

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<NotificationItem> notifications = [
    const NotificationItem(
      title: 'about your booking',
      body: 'your booking in 12/1/2025.',
      isError: false,
    ),
    const NotificationItem(title: 'wrong', body: 'attintion', isError: true),
    const NotificationItem(
      title: 'waitttttt',
      body: 'nbvgcfdchj',
      isError: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,

        title: Center(
          child: const Text(
            'Notifications',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      body: Container(
        color: Colors.grey[50],
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return NotificationCard(item: notifications[index]);
          },
        ),
      ),
    );
  }
}
