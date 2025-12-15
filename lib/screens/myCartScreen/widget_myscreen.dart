import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utilities/colors.dart';


final cart = [
  {
    "image": "assets/images/NikeClubMaxBlue.png",
    "title": "Nike Club Max",
    "price": "\$64.95",
    "size": "L"
  },
  {
    "image": "assets/images/NikeAirMax_Orangea_white.png",
    "title": "Nike Club Max",
    "price": "\$64.95",
    "size": "XL"
  },
  {
    "image": "assets/images/NikeClubMaxPurple.png",
    "title": "Nike Club Max",
    "price": "\$64.95",
    "size": "L"
  },
];

Widget summaryRow(String title, String value, {bool isBold = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
    child: Container(
      color: AppColors.bg,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 22,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget optionShoes(){
  return StatefulBuilder(builder: (context, setState) {
    return  Expanded(
      child: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
            final items = cart[index];
          return Container(
            height: 100,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: Color(0xFF1A2530),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                    height:87,
                    width: 87,
                    decoration: BoxDecoration(
                        color: AppColors.bg,
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Image.asset(items["image"]!, height: 80,fit: BoxFit.contain,)),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(items["title"]!,
                        style: TextStyle(color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        )),
                    Text(items["price"]!,
                        style: TextStyle(color: Colors.white)),
                    Row(
                      children: [
                        Container(
                          height:24,
                          width: 24,
                          decoration:BoxDecoration(
                              color: AppColors.bg,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Icon(Icons.remove,size:20 ,color: Colors.white,),
                        ),
                        SizedBox(width: 10,),
                        Text("1",style: TextStyle(
                            fontSize: 10,
                            color: Colors.white
                        ),),
                        SizedBox(width: 10,),
                        Container(
                          height:24,
                          width: 24,
                          decoration:BoxDecoration(
                              color: AppColors.bg,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Icon(Icons.add,size:20 ,color: Colors.white,),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(width: 140,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(items["size"]!,
                      style: TextStyle(
                          fontSize: 20,
                        color: Colors.white
                      ),),
                    SizedBox(height: 30,),
                    ImageIcon(AssetImage("assets/images/Icon.png"),size: 20,)
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  },); 
}

Widget bottomRows(){
  return StatefulBuilder(builder: (context, setState) {
    return Container(
      height: 370,
      decoration: BoxDecoration(
          color: AppColors.bg,
          borderRadius: BorderRadius.circular(16)
      ),child:Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
      child: Column(
        children: [
          summaryRow("Subtotal", "\$1250.00"),
          summaryRow("Shopping", "\$40.90"),
          const Divider(color: Colors.white30, height: 30),
          summaryRow("Total Cost", "\$1690.99", isBold: true),
          SizedBox(height: 20,),
          Container(
            width: 410,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4A9DFB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              onPressed: () {
                context.push('/CheckoutScreen');
              },
              child: const Text(
                "Checkout",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          )
        ],
      ),
    ),
    );
  },);
}

Widget iconBox(IconData icon) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      color: AppColors.bg,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Icon(icon, color: Colors.white70),
  );
}