import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/router/router_class.dart';
import 'package:task_1/session/session_class.dart';
import 'package:task_1/utilities/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    checkApp();
  }

  void checkApp() async {
    await SharedPrefsHelper().init();
    await Future.delayed(const Duration(seconds: 2));

    final bool loggedIn = await SharedPrefsHelper().isLoggedIn();
    if (!mounted) return;
    if (loggedIn) {
      context.go(RouterName.homeScreen.path);
    } else {
      context.go(RouterName.sliderScreen.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.chipBg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/shoes_2.png',
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              color: AppColors.bg,
            ),
          ],
        ),
      ),
    );
  }
}
