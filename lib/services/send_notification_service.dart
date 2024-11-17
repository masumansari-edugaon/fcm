import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:notification/services/get_server_key.dart';
import 'package:http/http.dart' as http;

class SendNotificationService {
  static Future<void> sendNotificationUsingApi({
    required String title,
    required String body,
    required String token,
    required Map<String, dynamic>? data,
  }) async {
    String serviceKey = await GetServerKey().getServerKeyToken();
    print('Server Key => $serviceKey');

    String url = 'https://fcm.googleapis.com/v1/projects/notification-50402/messages:send';

    var headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $serviceKey'
    };

    Map<String, dynamic> message = {
      "message": {
        "token": token,
        "notification": {
          "body": body,
          "title": title
          
        },
        "data": data
      }
    };
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(message),
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("Notification sent successfully");
        }
      } else {
        if (kDebugMode) {
          print("Failed to send notification. Status code: ${response.statusCode}");
          print("Response body: ${response.body}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error sending notification: $e");
      }
    }
  }
}
