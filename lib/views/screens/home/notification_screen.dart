import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final RemoteMessage message;
  const NotificationScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification Screen')),
      body: message != null ? Card(
        elevation: 5,
        child: ListTile(
          leading: CircleAvatar(
            child: Text(
              message.notification?.title?.substring(0,1) ?? "",
              style: const TextStyle(fontSize: 20),
            ),

          ),
          title: Text(message.notification?.title ?? ""),
          subtitle: Text(message.notification?.body ?? ""),
        ),
      ) : const Center(child: Text('No Notification'),),
    );
  }
}
