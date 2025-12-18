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
Widget optionShoes() {
  return StatefulBuilder(
    builder: (context, setState) {
      return Expanded(
        child: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final items = cart[index];
            return Container(
              height: 100,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                color: Color(0xFF1A2530),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    height: 84,
                    width: 84,
                    decoration: BoxDecoration(
                      color: AppColors.bg,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        items["image"]!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                   SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          items["title"]!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16, // Adjusted slightly for fit
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                         SizedBox(height: 4),
                        Text(
                          items["price"]!,
                          style: TextStyle(color: Colors.white70),
                        ),
                         SizedBox(height: 8),

                        Row(
                          children: [
                            _buildCounterBtn(Icons.remove),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                "1",
                                style: TextStyle(fontSize: 14, color: Colors.white),
                              ),
                            ),
                            _buildCounterBtn(Icons.add),
                          ],
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 9, bottom: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Pushes size to top/center and icon to bottom
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          items["size"]!,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        ImageIcon(
                          AssetImage("assets/images/Icon.png"),
                          size: 22,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
Widget _buildCounterBtn(IconData icon) {
  return Container(
    height: 24,
    width: 24,
    alignment: Alignment.center, // PERFECTLY CENTERS THE ICON
    decoration: BoxDecoration(
      color: AppColors.bg,
      shape: BoxShape.circle,
    ),
    child: Icon(icon, size: 16, color: Colors.white),
  );
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
    height: 40,
    width: 40,
    decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(20)
    ),
    child:Padding(
      padding: const EdgeInsets.only(left: 7),
      child: Icon(Icons.arrow_back_ios,color: AppColors.white,size: 20,),
    ),
  );
}