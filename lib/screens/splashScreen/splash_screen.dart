import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/router/router_class.dart';
import 'package:task_1/session/session_class.dart';
import 'package:task_1/utilities/colors.dart';

import '../../router/app_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void checkApp(BuildContext context) async {
    // 1. Initialize is REQUIRED before reading
    await SharedPrefsHelper().init();

    // 2. Wait for splash delay
    await Future.delayed(const Duration(seconds: 2));

    // 3. Check login status
    final loggedIn = SharedPrefsHelper().isLoggedIn();

    if (!context.mounted) return;

    if (await loggedIn) {
      context.go(RouterName.homeScreen.path);
    } else {
      context.go(RouterName.loginScreen.path);
    }
  }


  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      if (context.mounted) {
        context.go('/LoginScreen');
      }
    });

    return Scaffold(
      backgroundColor: AppColors.chipBg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/shoes_1.png',
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: AppColors.bg,
            ),
          ],
        ),
      ),
    );
  }
}
