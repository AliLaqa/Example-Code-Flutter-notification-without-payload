import 'package:fcm_push_notifications_flutter/Views/SecondScreen.dart';
import 'package:fcm_push_notifications_flutter/Views/ThirdScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';
import 'NotificationReceiverHelper/NotificationReceiverHelper.dart';
import 'ThisDeviceTokenProvider/ThisDeviceToken.dart';
import 'firebase_options.dart';


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  ///TODO: Here we are selecting the type of notification which we made in CustomNotification.dart
  ///We  have made three types of notifications in CustomNotification.dart file.
  if (message.notification!.title!.startsWith("alert")) {
    CustomNotification.NewOrder(message);
  } else if (message.notification!.title!.startsWith("message")) {
    CustomNotification.NewMessage(message);
  } else {
    CustomNotification.Others(message);
  }
}

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.getInitialMessage();
  } catch (e) {print("Error on main function => $e");}
  runApp(const MyApp());
}

// void main() async {
//
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   runApp(const MyApp());
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeMessaging();
  }

  Future<void> initializeMessaging() async {
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification!.title!.startsWith("alert")) {
        CustomNotification.NewOrder(message);
      } else if (message.notification!.title!.startsWith("message")) {
        CustomNotification.NewMessage(message);
      } else {
        CustomNotification.Others(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.notification!.title!.startsWith("alert")) {
        CustomNotification.NewOrder(message);
      } else if (message.notification!.title!.startsWith("message")) {
        CustomNotification.NewMessage(message);
      } else {
        CustomNotification.Others(message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ///To initialize Notifications
    CustomNotification.init();
    ///To get the device token when app is run
    thisDeviceToken();
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
      routes: {
        '/alert': (context) => const HomeScreen(),
        '/message': (context) => const SecondScreen(),
        '/other': (context) => const ThirdScreen(),
      },
    );
  }
}



///Backup
// import 'package:fcm_push_notifications_flutter/Views/SecondScreen.dart';
// import 'package:fcm_push_notifications_flutter/Views/ThirdScreen.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
//
// import 'HomeScreen.dart';
// import 'NotificationReceiverHelper/NotificationReceiverHelper.dart';
// import 'ThisDeviceTokenProvider/ThisDeviceToken.dart';
// import 'firebase_options.dart';
//
//
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   ///TODO: Here we are selecting the type of notification which we made in CustomNotification.dart
//   ///We  have made three types of notifications in CustomNotification.dart file.
//   if (message.notification!.title!.startsWith("alert")) {
//     CustomNotification.alertNotification(message);
//   } else if (message.notification!.title!.startsWith("message")) {
//     CustomNotification.newMessageNotification(message);
//   } else {
//     CustomNotification.otherNotification(message);
//   }
// }
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   // This widget is the root of your application.
//   ///Made instance of NotificationServices class we made in notification_services file
//   NotificationServices notificationServices = NotificationServices();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     ///To interact with notification when app in background
//     notificationServices.onMessage(context);
//     ///To interact with notification when app in active
//     notificationServices.onMessageOpenedApp(context);
//     ///To get the device token when app is run
//     thisDeviceToken();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     CustomNotification.init();
//     return MaterialApp(debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: HomeScreen(),
//       routes: {
//         '/alert': (context) => const HomeScreen(),
//         '/message': (context) => const SecondScreen(),
//         '/other': (context) => const ThirdScreen(),
//       },
//     );
//   }
// }
