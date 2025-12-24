import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/screens/accountSettingScreen/widget_account.dart';
import 'package:task_1/screens/detailsScreen/widget_details.dart';
import 'package:task_1/utilities/colors.dart';

import '../widgets/app_bar.dart';

class AccountSettingScreen extends StatefulWidget {
  const AccountSettingScreen({super.key});

  @override
  State<AccountSettingScreen> createState() => _AccountSettingScreenState();
}


class _AccountSettingScreenState extends State<AccountSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.chipBg,
      body: SafeArea(
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                uperRow(context),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                   child: Row(
                    children: [
                      Text("Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ],
                   ),
                 ),
                SizedBox(height: 10,),
               settingRows(image:"assets/images/Notifications.png",
                   title: "Notification Setting",),
                SizedBox(height: 9,),
                Divider(color: Color(0xff161F28),),
                settingRows(
                    image: "assets/images/Shopping.png",
                    title:"Shipping Address",
                    ),
                SizedBox(height: 9,),
                Divider(color: Color(0xff161F28),),
               settingRows(
                   image: "assets/images/Payment.png",
                   title: "Payment info",
                   ),
                SizedBox(height: 9,),
                Divider(color: Color(0xff161F28),),
                settingRows(image: "assets/images/Icon.png",
                    title:"Delete Account",
                ),
                Divider(color: Color(0xff161F28),),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text("App Settings",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 25,),
                appSetting(title: "Enable Face ID For Log In"),
                Divider(color: Color(0xff161F28),),
                appSetting(title: "Enable Push Notifications"),
                Divider(color: Color(0xff161F28),),
                appSetting(title: "Enable Location Services"),
                Divider(color: Color(0xff161F28),),
                appSetting(title: "Dark Mode"),
                Divider(color: Color(0xff161F28),),
              ],
            ),
          )),
    );
  }
}
