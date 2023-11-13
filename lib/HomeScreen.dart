import 'package:fcm_push_notifications_flutter/ThisDeviceTokenProvider/ThisDeviceToken.dart';
import 'package:fcm_push_notifications_flutter/Views/SecondScreen.dart';
import 'package:fcm_push_notifications_flutter/Views/ThirdScreen.dart';
import 'package:flutter/material.dart';

import 'NotificationReceiverHelper/NotificationReceiverHelper.dart';
import 'NotificationSenderHelper/NotificationSenderHelper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              // image: DecorationImage(image: AssetImage("assets/home.jpg")),
              color: Colors.blueAccent.shade400.withOpacity(0.7)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///TODO: Sending Notification Buttons Section Start-------------------->

              ///New Order Notification navigating to HomeScreen.
              ElevatedButton(
                  onPressed: () {
                    String token = myToken;
                    String title = "alert";
                    String type = "alert";
                    String bodye = "Hello, this is a New Order notification";
                    SendMessageApi().sendMessage(token, bodye, title, type);
                  },
                  child: const Text("NewOrder/alert Notification")),

              ///NewMessage Notification navigating to SecondScreen
              ElevatedButton(
                  onPressed: () {
                    String token = myToken;
                    String title = "message";
                    String type = "message";
                    String bodye = "Hello, this is a test NewMessage notification";
                    SendMessageApi().sendMessage(token, bodye, title, type);
                  },
                  child: const Text("New Message Notification")),

              ///other Notification navigating to SecondScreen
              ElevatedButton(
                  onPressed: () {
                    String token = myToken;
                    String title = "other";
                    String type = "other";
                    String bodye = "Hello, this is a test other notification";
                    SendMessageApi().sendMessage(token, bodye, title, type);
                  },
                  child: const Text("other Notification")),

              ///Todo: Navigation Buttons Section Start------------------------------>
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 5),
                child: Text(
                  "Navigation Buttons Below",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black),
                ),
              ),

              ///SecondScreen Navigation Button
              OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondScreen()));
                  },
                  child: const Text(
                    "Go to Second Screen",
                    style: TextStyle(color: Colors.black),
                  )),

              ///ThirdScreen Navigation Button
              OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ThirdScreen()));
                  },
                  child: const Text(
                    "Go to Third Screen",
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
