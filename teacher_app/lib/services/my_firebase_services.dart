import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> handlemessage(RemoteMessage message) async {
  log('${message.notification!.title}');
  log('${message.notification!.body}');
  log('${message.data}');
}

class NtificationConfig {
  final FirebaseMessaging _firebasemessaging = FirebaseMessaging.instance;
  final _androidchannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notification',
    description: "This channel is used for important Notifications",
    importance: Importance.defaultImportance,
  );
  final _localnotification = FlutterLocalNotificationsPlugin();

  notificationconfig() async {
    await _firebasemessaging.requestPermission();
    final fcm = await _firebasemessaging.getToken();
    // Shared.setstring("device_token",fcm!);
    GetStorage().write('fire_token', fcm);
    log('--------------------------------------');
    log('$fcm');
    initpushnotification();
    initlocalnotification();
  }

  Future initpushnotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await FirebaseMessaging.instance.getInitialMessage().then(
      (value) {
        FirebaseMessaging.onMessageOpenedApp.listen(handlemessage);
        FirebaseMessaging.onBackgroundMessage(handlemessage);
        FirebaseMessaging.onMessage.listen(
          (event) {
            final notification = event.notification;
            if (notification != null) {
              _localnotification.show(
                notification.hashCode,
                notification.title,
                notification.body,
                NotificationDetails(
                  android: AndroidNotificationDetails(
                    _androidchannel.id,
                    _androidchannel.name,
                    channelDescription: _androidchannel.description,
                    icon: '@drawable/ic_launcher',
                  ),
                ),
                payload: jsonEncode(event.toMap()),
              );
            }
          },
        );
      },
    );
  }

  Future initlocalnotification() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);
    await _localnotification.initialize(
      settings,
      onDidReceiveNotificationResponse: localhandle,
    );
  }

  localhandle(NotificationResponse response) {
    final message = RemoteMessage.fromMap(jsonDecode(response.payload!));
    handlemessage(message);
  }
}
