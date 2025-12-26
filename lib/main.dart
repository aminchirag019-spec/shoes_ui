import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:network_aware_package/network_aware_package.dart';
import 'package:task_1/router/app_router.dart';
import 'package:task_1/session/session_class.dart';

import 'connectivity/connectivity_checker.dart';
import 'firebase_options.dart';

final SharedPrefsHelper sharedprefshelper = SharedPrefsHelper();




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NetworkService.instance.initialize();
  await sharedprefshelper.init();
  runApp(const MyApp());
}
TextEditingController email= TextEditingController();



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
            title: "Shoes Ui",
            theme: ThemeData(
                useMaterial3: true,
                ),
            );
      },
    );
    }
}


