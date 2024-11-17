import 'package:firebase_messaging/firebase_messaging.dart';

class FcmService {
  static void firebaseInit() {
    FirebaseMessaging.onMessage.listen(
      (massage) {
        print(massage.notification!.title);
        print(massage.notification!.body);
      },
    );
  }
}
