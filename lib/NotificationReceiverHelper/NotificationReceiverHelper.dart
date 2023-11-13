import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CustomNotification {
  static final _notification = FlutterLocalNotificationsPlugin();

  static Future init({bool scheduled = false}) async {
    var initAndroidSetting = const AndroidInitializationSettings("@mipmap/ic_launcher");
    var ios = const DarwinInitializationSettings();
    final setting = InitializationSettings(android: initAndroidSetting, iOS: ios);
    await _notification.initialize(setting);
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()!.requestNotificationsPermission();
  }


  static void NewOrder(RemoteMessage message) async {
    print("NewOrder Notification is hit");
    print("Received title: ${message.notification!.title!}");
    print("Received body: ${message.notification!.body!.toString()}");
    try {
      Random random = Random();
      int id = random.nextInt(10000);
      NotificationDetails notificationDetails =
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "pushnotificationapp2",
          "pushnotificationappchannel",
          importance: Importance.max,
          priority: Priority.high,
          sound: RawResourceAndroidNotificationSound("alert"),
        ),
      );
      await _notification.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print('Error>>>$e');
    }
  }
  static void NewMessage(RemoteMessage message) async {
    print("NewMessage Notification is hit");
    print("Received title: ${message.notification!.title!}");
    print("Received body: ${message.notification!.body!.toString()}");
    try {
      Random random = Random();
      int id = random.nextInt(10000);
      const NotificationDetails notificationDetails =
      NotificationDetails(
        android: AndroidNotificationDetails(
          "pushnotificationapp7",
          "pushnotificationappchannel7",
          importance: Importance.max,
          priority: Priority.high,
          sound: RawResourceAndroidNotificationSound("newmessage"),
        ),
      );
      await _notification.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print('Error>>>$e');
    }
  }

  static void Others(RemoteMessage message) async {
    print("Other Notification is hit");
    print("Received title: ${message.notification!.title!}");
    print("Received body: ${message.notification!.body!.toString()}");
    try {
      Random random = Random();
      int id = random.nextInt(10000);
      const NotificationDetails notificationDetails =
      NotificationDetails(
        android: AndroidNotificationDetails(
          "pushnotificationapp6",
          "pushnotificationappchannel",
          importance: Importance.max,
          priority: Priority.high,
          sound: RawResourceAndroidNotificationSound("other"),
        ),
      );
      await _notification.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print('Error>>>$e');
    }
  }
}