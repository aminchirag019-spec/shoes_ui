import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/screens/detailsScreen/widget_details.dart';
import 'package:task_1/screens/favoriteScreen/widget_favourite.dart' hide iconBox;
import 'package:task_1/utilities/colors.dart';
import 'package:task_1/utilities/icons.dart';


class NotificationScreen extends StatefulWidget {
   NotificationScreen({super.key});





  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}


final Items = [
  {
    "image" :"assets/images/NikeClubMaxBlue.png",
    "title" : "We Have New \n Products With Offers",
    "Price" : "\$364.95  \$260.00",
    "time"  : "6 mins ago"
  },
  {
    "image" :"assets/images/NikeAirMax_Orangea_white.png",
    "title" : "We Have New\nProducts With Offers",
    "Price" : "\$364.95  \$260.00",
    "time"  : "26 mins ago"
  },
];

final Items2 =[
  {
    "image" :"assets/images/jordan.png",
    "title" : "We Have New \n Products With Offers",
    "Price" : "\$364.95  \$260.00",
    "time"  : "4 days ago"
  },
  {
    "image" :"assets/images/NikeClubMax.png",
    "title" : "We Have New\nProducts With Offers",
    "Price" : "\$364.95  \$260.00",
    "time"  : "4 days ago"
  },
];
class _NotificationScreenState extends State<NotificationScreen> {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      child: IconButton(onPressed:() {
                        context.go('/HomeScreen');
                      },
                          icon: iconBox(GIcons.back),)
                    ),
                    Text("Notifications",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text("Clear All",
                      style: TextStyle(
                        color: AppColors.blue,
                      ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Row(
                    children: [
                      Text("Today",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize:20,
                        color: AppColors.white
                      ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: Expanded(
                      child:ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) {
                        final item = Items[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 85,
                                decoration: BoxDecoration(
                                color: Color(0xff161F28),
                                  borderRadius: BorderRadius.circular(14)
                                ),
                                child: Image.asset(item["image"]!,
                                  height: 70,
                                  width: 100,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item["title"]!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600
                                  ),
                                  ),
                                  Text(item["Price"]!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.white
                                  ),
                                  )
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,0,50),
                                child: Text(item["time"]!,style: TextStyle(
                                  color: AppColors.grey
                                ),),
                              ), // SizedBox(height: 45,),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,10,0),
                                child: Icon(GIcons.fiber,
                                  color: AppColors.blue,
                                size: 10,
                                ),
                              )
                            ],
                          ),
                        );
                      },) ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Row(
                    children: [
                      Text("Yesterday",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize:20,
                            color: AppColors.white
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: Expanded(
                      child:ListView.builder(itemBuilder: (context, index) {
                        final items = Items2[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 85,
                                decoration: BoxDecoration(
                                    color: Color(0xff161F28),
                                    borderRadius: BorderRadius.circular(14)
                                ),
                                child: Image.asset(items["image"]!,
                                  height: 70,
                                  width: 100,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(items["title"]!,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  Text(items["Price"]!,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.white
                                    ),
                                  )
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,0,50),
                                child: Text(items["time"]!,style: TextStyle(
                                    color: AppColors.grey
                                ),),
                              ), // SizedBox(height: 45,),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,10,0),
                                child: Icon(GIcons.fiber,
                                  color: AppColors.grey,
                                  size: 10,
                                ),
                              )
                            ],
                          ),
                        );
                      },) ),
                ),
              ],
            ),
          ) ),
    );
  }
}
