import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/router/router_class.dart';
import 'package:task_1/utilities/colors.dart';
import 'package:task_1/utilities/icons.dart';
import 'package:task_1/utilities/media_query.dart';

import '../widgets/app_bar.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

final Items = [
  {
    "image": "assets/images/NikeClubMaxBlue.png",
    "title": "We Have New \n Products With Offers",
    "Price": "\$364.95",
    "time": "6 mins ago",
    "original price": "\$260.00",
  },
  {
    "image": "assets/images/NikeAirMax_Orangea_white.png",
    "title": "We Have New\nProducts With Offers",
    "Price": "\$364.95",
    "time": "26 mins ago",
    "original price": "\$260.00",
  },
];

final Items2 = [
  {
    "image": "assets/images/jordan.png",
    "title": "We Have New \n Products With Offers",
    "Price": "\$364.95",
    "original price": "\$260.00",
    "time": "4 days ago"
  },
  {
    "image": "assets/images/NikeClubMax.png",
    "title": "We Have New\nProducts With Offers",
    "Price": "\$364.95",
    "original price": "\$260.00",
    "time": "4 days ago"
  },
];

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go(RouterName.homeScreen.path);
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.chipBg,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        context.go(RouterName.homeScreen.path);
                      },
                      icon: iconBox(
                        GIcons.back,
                      )),
                  Text(
                    "Notifications",
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Clear All",
                    style: TextStyle(color: AppColors.blue, fontSize: 16),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "Today",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: AppColors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height(context) * 0.25,
                child: Expanded(
                    child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    final item = Items[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            height: height(context) * 0.1,
                            decoration: BoxDecoration(
                                color: Color(0xff161F28),
                                borderRadius: BorderRadius.circular(14)),
                            child: Image.asset(
                              item["image"]!,
                              height: height(context) * 0.07,
                              width: width(context) * 0.25,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["title"]!,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  Text(
                                    item["Price"]!,
                                    style: TextStyle(
                                        fontSize: 16, color: AppColors.white),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    item["original price"]!,
                                    style: TextStyle(
                                        fontSize: 16, color: AppColors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                            child: Text(
                              item["time"]!,
                              style: TextStyle(
                                  color: AppColors.grey, fontSize: 12),
                            ),
                          ), // SizedBox(height: 45,),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                              GIcons.fiber,
                              color: AppColors.blue,
                              size: 10,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "Yesterday",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: AppColors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height(context) * 0.3,
                width: width(context) * 0.95,
                child: ListView.builder(
                  itemCount: Items2.length,
                  itemBuilder: (context, index) {
                    final items = Items2[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 85,
                            decoration: BoxDecoration(
                                color: Color(0xff161F28),
                                borderRadius: BorderRadius.circular(14)),
                            child: Image.asset(
                              items["image"]!,
                              height: height(context) * 0.07,
                              width: width(context) * 0.25,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items["title"]!,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  Text(
                                    items["Price"]!,
                                    style: TextStyle(
                                        fontSize: 16, color: AppColors.white),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    items["original price"]!,
                                    style: TextStyle(
                                        fontSize: 16, color: AppColors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                            child: Text(
                              items["time"]!,
                              style: TextStyle(
                                  color: AppColors.grey, fontSize: 12),
                            ),
                          ), // SizedBox(height: 45,),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                              GIcons.fiber,
                              color: AppColors.grey,
                              size: 10,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
