import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/router/router_class.dart';
import 'package:task_1/utilities/colors.dart';

import '../widgets/app_bar.dart';

Widget uperRow(BuildContext context) {
  return Row(
    children: [
      IconButton(
        onPressed: () {
          context.go(RouterName.bestSellerScreen.path);
        },
        icon: iconBox(Icons.arrow_back_ios),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Text(
          "Account & Settings",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
        ),
      )
    ],
  );
}

Widget settingRows({
  required String image,
  required String title,
}) {
  return Container(
    height: 40,
    child: Row(
      children: [
        ImageIcon(
          AssetImage(image),
          size: 40,
          color: Colors.grey,
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
            child: Text(
          title,
          style: TextStyle(fontSize: 20, color: Colors.white),
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Icon(Icons.arrow_forward_ios,size: 20,color: AppColors.grey,)
          ),
      ],
    ),
  );
}

bool isOn = false;

Widget appSetting({required String title}) {
  return StatefulBuilder(
    builder: (context, setState) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded( // Expanded must be a direct child of Row/Column
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Switch(
              value: isOn, // Uses the variable from the outer scope
              onChanged: (value) {
                setState(() {
                  isOn = value; // Now it persists
                });
              },
            ),
          ],
        ),
      );
    },
  );
}
