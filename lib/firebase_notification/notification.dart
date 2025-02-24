import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // Ensure binding is initialized
  await Firebase.initializeApp(); // Initialize Firebase
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: NotificationPage(),
    );
  }
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  String? token = "";

  void askNotificationPermission() async {
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("✅ Notification permission granted!");
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print("⚠️ Notification permission granted provisionally.");
    } else {
      print("❌ Notification permission denied.");
    }

    // Retrieve FCM Token (for Android)
    token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      print("✅ FCM Token: $token");
    } else {
      print("❌ FCM Token is null");
    }
  }


  @override
  void initState(){
    super.initState();

    askNotificationPermission();

  }

  @override
  Widget build(BuildContext context) {


    FirebaseMessaging.instance.onTokenRefresh
        .listen((fcmToken) {

      token = fcmToken;

      // Note: This callback is fired at each app startup and whenever a new
      // token is generated.
    })
        .onError((err) {
      print("Error: " + err);
    });


    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ElevatedButton(
            //   onPressed: () {
            //     // Simulate a notification
            //     showNotification(context, 'New Message', 'You have a new message');
            //   },
            //   child: Text('Show Notification'),
            // ),
          ],
        ),
      ),
    );
  }
}

