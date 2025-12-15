import 'package:flutter/material.dart';
import 'package:task_1/screens/bestSellerScreen/widget_seller.dart';
import 'package:task_1/screens/detailsScreen/widget_details.dart';
import 'package:task_1/utilities/colors.dart';

class BestSellerScreen extends StatefulWidget {
  const BestSellerScreen({super.key});

  @override
  State<BestSellerScreen> createState() => _BestSellerScreenState();
}

class _BestSellerScreenState extends State<BestSellerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1A2530),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconBox(Icons.arrow_back),
                  SizedBox(width: 110,),
                  Text("Best Sellers",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                  ),
                  ),
                  SizedBox(width: 55,),
                  Icon(Icons.settings),
                  SizedBox(width: 15,),
                  iconBox(Icons.search)
                ],
              ),
              SizedBox(height: 15,),
              shoesOptions2()
            ],
          ),
        ),
      ),
    );
  }
}
