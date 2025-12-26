import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/router/router_class.dart';
import 'package:task_1/screens/bestSellerScreen/widget_seller.dart';
import 'package:task_1/screens/detailsScreen/widget_details.dart';
import 'package:task_1/utilities/colors.dart';
import 'package:task_1/utilities/media_query.dart';

import '../widgets/app_bar.dart';

class BestSellerScreen extends StatefulWidget {
  const BestSellerScreen({super.key});

  @override
  State<BestSellerScreen> createState() => _BestSellerScreenState();
}
class _BestSellerScreenState extends State<BestSellerScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        context.go(RouterName.homeScreen.path);
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xff1A2530),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(onPressed: () {
                        context.push(RouterName.homeScreen.path);
                      }, icon:iconBox(Icons.arrow_back_ios),),
                      SizedBox(width:width(context)*0.16,),
                      Text("Best Sellers",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                      ),
                      ),
                      SizedBox(width:width(context)*0.13,),
                      ImageIcon(AssetImage("assets/images/Filter.png"),color: Colors.white,),
                      SizedBox(width:width(context)*0.03,),
                       ImageIcon(AssetImage("assets/images/search.png"),color: Colors.white,),
                    ],
                  ),
                ),
                 SizedBox(height: 15,),
                Expanded(child:shoesOptions2())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
