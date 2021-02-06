import 'package:ScriptFoundation/screens/pages/blog.dart';
import 'package:ScriptFoundation/screens/pages/community.dart';
import 'package:ScriptFoundation/screens/pages/events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ScriptFoundation/main.dart';

class NotificationService {
  FlutterLocalNotificationsPlugin localNotifications =
      FlutterLocalNotificationsPlugin();

  ///Initializing [local notifications]
  void initializeNotificationService() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    localNotifications.initialize(
      initializationSettings,
      onSelectNotification: onNotificationTapped,
    );
  }

  ///Handling the navigation to based on the [payload] received
  ///from the notification
  Future<void> onNotificationTapped(String payload) async {
    if (payload != null) {
      if (payload == "event") {
        navigatorKey.currentState
            ?.push(CupertinoPageRoute(builder: (_) => EventPage()));
      } else if (payload == "blog") {
        navigatorKey.currentState
            ?.push(CupertinoPageRoute(builder: (_) => BlogPage()));
      } else if (payload == "community") {
        navigatorKey.currentState
            ?.push(CupertinoPageRoute(builder: (_) => CommunityPage()));
      }
    }
  }

  ///Creating a [notification_channel] so as to show heads up notifications
  ///even when the app is in foreground
  Future<void> createChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'script_fcm_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.', // description
      importance: Importance.max,
    );
    await localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }
}
