import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:network_aware_package/network_aware_package.dart';
import 'package:task_1/router/app_router.dart';

import 'connectivity/connectivity_checker.dart';
import 'firebase_options.dart';
import 'session/session_class.dart';

final SharedPrefsHelper sharedprefshelper = SharedPrefsHelper();
final FlutterLocalNotificationsPlugin localNotifications =
FlutterLocalNotificationsPlugin();

/// 🔴 MUST be top-level & BEFORE main()
Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  debugPrint("🔔 Background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// 🔹 Register background handler
  FirebaseMessaging.onBackgroundMessage(
    firebaseMessagingBackgroundHandler,
  );

  /// 🔹 Notification permission
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  final token = await FirebaseMessaging.instance.getToken();
  debugPrint("📱 FCM TOKEN: $token");

  const AndroidNotificationChannel channel =
  AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    importance: Importance.max,
  );

  await localNotifications
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);


  const AndroidInitializationSettings androidInit =
  AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initSettings =
  InitializationSettings(android: androidInit);

  await localNotifications.initialize(initSettings);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    final notification = message.notification;

    if (notification != null) {
      localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
      );
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    debugPrint("📨 App opened from notification");
  });

  NetworkService.instance.initialize();
  await sharedprefshelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return NetworkAwareBuilder(
      builder: (context, isOnline) {
        AppNetworkService.instance.update(isOnline);

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: approuter,
          title: "Shoes UI",
          theme: ThemeData(
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
