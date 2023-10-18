import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FireNotificationConfig {
  final _localnotification = FlutterLocalNotificationsPlugin();

  final _androidchannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notification',
    description: "This channel is used for important Notifications",
    importance: Importance.defaultImportance,
  );

  Future<void> notificationConfig() async {
    await FirebaseMessaging.instance.requestPermission();
    final myFCMToken = await FirebaseMessaging.instance.getToken();
    GetStorage().write('fire_token', myFCMToken);

    setupInteractedMessage();
    initLocalNotification();
  }

  Future<void> setupInteractedMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    FirebaseMessaging.onBackgroundMessage(_handleMessage);

    // Local Notification
    await _localnotification
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_androidchannel);

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage event) {
        RemoteNotification? notification = event.notification;
        AndroidNotification? android = event.notification?.android;
        if (notification != null && android != null) {
          _localnotification.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                _androidchannel.id,
                _androidchannel.name,
                channelDescription: _androidchannel.description,
                icon: android.smallIcon, //'@drawable/ic_launcher'
              ),
            ),
            payload: jsonEncode(event.toMap()),
          );
        }
      },
    );
  }

  Future<void> initLocalNotification() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@drawable/ic_launcher'),
    );
    await _localnotification.initialize(
      settings,
      onDidReceiveNotificationResponse: _localhandle,
    );
  }

  Future<void> _localhandle(NotificationResponse response) =>
      _handleMessage(RemoteMessage.fromMap(jsonDecode(response.payload!)));

  Future<void> _handleMessage(RemoteMessage message) async {
    if (message.data['type'] == 'chat') {
      Get.to('');
    }
    log('${message.notification!.title}');
    log('${message.notification!.body}');
    log('${message.data}');
  }
}
