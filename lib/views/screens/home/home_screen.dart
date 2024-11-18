import 'package:flutter/material.dart';
import 'package:notification/services/fcm_service.dart';
import 'package:notification/services/notification_service.dart';

import '../../../services/send_notification_service.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationService notificationService = NotificationService();
  TextEditingController messageTitleController = TextEditingController();
  TextEditingController messageBodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    notificationService.requestNotificationPermission();
    notificationService.getDeviceToken();
    FcmService.firebaseInit();
    notificationService.firebaseInit(context);
    notificationService.setupInteractMessage(context);
  }





  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen'), actions: [
        IconButton(icon: const Icon(Icons.notifications), onPressed: () {})
      ]),
      body: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: messageTitleController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: messageBodyController,
                  decoration: const InputDecoration(
                    hintText: 'Enter message',
                    border: OutlineInputBorder(),
                  ),
                ),
                ElevatedButton(
                   child: const Text('Message send'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green)
                  ),
                  onPressed: () async {
                    await SendNotificationService.sendNotificationUsingApi(
                        title: messageTitleController.text,
                        body: messageBodyController.text,
                        token:
                        'c1KFunLOQ9eYZzZGrUlC_R:APA91bEYcdZw2hzbcxJ9x5nPEIgMnDqazgaVfwO20Ggd7Mv427h5K--EFEDaLwtaENDi_huDfsLbXRo-YYfbnxXj-7hBVGI0KxYf1uiqbeVoSA4fRlz1Dds',
                        data: {"screen": "notification"});
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}