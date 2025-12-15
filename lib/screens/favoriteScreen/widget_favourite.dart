import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utilities/colors.dart';


final items = [
  {
    "image": "assets/images/NikeAirJordan_Orange.png",
    "title": "Best Seller",
    "Name": "Nike Jordan",
    "price": "\$58.7",
  },
  {
    "image": "assets/images/shoes_4.png",
    "title": "Best Seller",
    "Name": "Nike Air Max",
    "price": "\$37.8",
  },
  {
    "image": "assets/images/NikeClubMax.png",
    "title": "Best Seller",
    "Name": "Nike Club Max",
    "price": "\$47.7",
  },
  {
    "image": "assets/images/NikeAirMax_Orangea_white.png",
    "title": "Best Seller",
    "Name": "Nike Jordan",
    "price": "\$57.6",
  }
];


Widget shoesOptions(){
  return StatefulBuilder(builder: (context, setState) {
    return Expanded(
      child: GridView.builder(
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 21,
          mainAxisSpacing: 20,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          final image = item['image'] as String;
          final title = item['title'] as String;
          final name = item['Name'] as String;
          final price = item['price'] as String;

          return Container(
            decoration: BoxDecoration(
              color: AppColors.bg,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    image,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                Spacer(),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Color(0xFF5B9EE1),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  price,
                  style: GoogleFonts.poppins(
                    color: Colors.greenAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
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


