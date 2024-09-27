import 'package:flutter/material.dart';

class NotificationPreview extends StatelessWidget {
  final String title;
  final String message;

  const NotificationPreview({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListTile(
                title: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    message,
                    style: const TextStyle(fontSize: 12.0),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}