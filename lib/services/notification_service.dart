import 'dart:io';
import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:notification/views/screens/home/home_screen.dart';
import 'package:notification/views/screens/home/notification_screen.dart';

class NotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // for notification requests
  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print("Notification permission granted");
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print("Notification permission provisional granted");
      }
    } else {
      Get.snackbar('Notification permission denied',
          "Please allow notification to receive updates.",
          snackPosition: SnackPosition.BOTTOM);
      Future.delayed(
        const Duration(seconds: 2),
        () {
          AppSettings.openAppSettings(type: AppSettingsType.notification);
        },
      );
    }
  }

  // get Token
  Future<String> getDeviceToken() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    String? deviceToken = await messaging.getToken();
    if (kDebugMode) {
      print('deviceToken=> $deviceToken');
    }
    return deviceToken!;
  }

  void initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    var androidInitSettings =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    var iosInitSettings = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: androidInitSettings, iOS: iosInitSettings);

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (payload) {
          handleMessage(context, message);
        });
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen(
      (message) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification!.android;

        if (kDebugMode) {
          print('notification title: ${notification!.title}');
          print('notification body: ${notification.body}');
        }
        // ios
        if (Platform.isIOS) {
          iosForGroundMessage();
        }
        // android
        if (Platform.isAndroid) {
          initLocalNotifications(context, message);
          showNotification(message);
        }
      },
    );
  }

  // function to show notification
  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      message.notification!.android!.channelId.toString(),
      message.notification!.android!.channelId.toString(),
      importance: Importance.high,
      showBadge: true,
      playSound: true,
    );
    // android settings
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            channel.id.toString(), channel.name.toString(),
            channelDescription: 'ChannelDescription',
            importance: Importance.high,
            priority: Priority.high,
            playSound: true,

            sound: channel.sound);

    // ios settings
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    // marge settings
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    // show notification
    Future.delayed(
      Duration.zero,
      () {
        _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails,
          payload: "My_Data",
        );
      },
    );
  }

  // background and terminated messages
  Future<void> setupInteractMessage(BuildContext context) async {
    // background state
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        handleMessage(context, message);
      },
    );

    // terminated state
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null && message.data.isNotEmpty) {
        handleMessage(context, message);
      }
    });
  }

  // handle message
  Future<void> handleMessage(
      BuildContext context, RemoteMessage? message) async {

    if(message?.data['screen'] == 'notification') {
      Get.to(NotificationScreen(message: message ?? const RemoteMessage(),));
    }
    else {
      Get.to(const HomeScreen());
    }
  }

  // ios message
  void iosForGroundMessage() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
