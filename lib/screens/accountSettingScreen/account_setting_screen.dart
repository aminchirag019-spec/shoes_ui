import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/screens/detailsScreen/widget_details.dart';
import 'package:task_1/utilities/colors.dart';

class AccountSettingScreen extends StatefulWidget {
  const AccountSettingScreen({super.key});

  @override
  State<AccountSettingScreen> createState() => _AccountSettingScreenState();
}

bool Ison =false;

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
                Row(
                  children: [
                    IconButton(onPressed:() {
                      context.push('/BestSellerScreen');
                    },
                        icon: iconBox(Icons.arrow_back_ios),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 90),
                      child: Text("Account & Settings",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600
                      ),
                      ),
                    )
                  ],
                ),
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
                Container(
                  height: 40,
                  child: Row(
                    children: [
                      ImageIcon(AssetImage("assets/images/Notifications.png"),
                      size:40,
                        color: Colors.grey,

                      ),
                      SizedBox(width: 20,),
                      Expanded(
                          child:Text("Notification Setting",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                          ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(Icons.arrow_forward_ios,size: 22,
                        color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 9,),
                Divider(color: Color(0xff161F28),),
                Container(
                  height: 40,
                  child: Row(
                    children: [
                      ImageIcon(AssetImage("assets/images/Shopping.png"),
                        size:40,
                        color: Colors.grey,

                      ),
                      SizedBox(width: 20,),
                      Expanded(
                          child:Text("Shipping Address",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(Icons.arrow_forward_ios,size: 22,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 9,),
                Divider(color: Color(0xff161F28),),
                Container(
                  height: 40,
                  child: Row(
                    children: [
                      ImageIcon(AssetImage("assets/images/Payment.png"),
                        size:40,
                        color: Colors.grey,

                      ),
                      SizedBox(width: 20,),
                      Expanded(
                          child:Text("Payment info",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(Icons.arrow_forward_ios,size: 22,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 9,),
                Divider(color: Color(0xff161F28),),
                Container(
                  height: 40,
                  child: Row(
                    children: [
                      ImageIcon(AssetImage("assets/images/Icon.png"),
                        size:40,
                        color: Colors.grey,

                      ),
                      SizedBox(width: 20,),
                      Expanded(
                          child:Text("Delete Account",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(Icons.arrow_forward_ios,size: 22,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 9,),
                    ],
                  ),
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
                Container(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Expanded(child: Text("Enable Face ID For Log In",
                        style: TextStyle(
                          fontSize: 20,
                            color:Colors.white
                        ),
                        )),
                      ),
                      Switch(value: Ison,
                        onChanged:
                          (value) {
                            setState(() {
                              Ison = value;
                            });
                          },
                      ),
                    ],
                  ),
                ),
                Divider(color: Color(0xff161F28),),
                Container(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Expanded(child: Text("Enable Push Notifications",
                          style: TextStyle(
                              fontSize: 20,
                              color:Colors.white
                          ),
                        )),
                      ),
                      Switch(value: Ison,
                        onChanged:
                            (value) {
                          setState(() {
                            Ison = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Divider(color: Color(0xff161F28),),
                Container(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Expanded(child: Text("Enable Location Services",
                          style: TextStyle(
                              fontSize: 20,
                              color:Colors.white
                          ),
                        )),
                      ),
                      Switch(value: Ison,
                        onChanged:
                            (value) {
                          setState(() {
                            Ison = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Divider(color: Color(0xff161F28),),
                Container(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Expanded(child: Text("Dark Mode",
                          style: TextStyle(
                              fontSize: 20,
                              color:Colors.white
                          ),
                        )),
                      ),
                      Switch(value: Ison,
                        onChanged:
                            (value) {
                          setState(() {
                            Ison = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Divider(color: Color(0xff161F28),),
              ],
            ),
          )),
    );
  }
}
