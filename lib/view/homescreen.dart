import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data['name'] ?? '',style: TextStyle(
                fontSize: 30
            ),),
            Text(data['email'],style: TextStyle(
                fontSize: 30
            ),),
          ],
        ),
      ),
    );
  }
}
