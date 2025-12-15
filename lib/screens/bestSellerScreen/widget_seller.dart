import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utilities/colors.dart';
import '../favoriteScreen/widget_favourite.dart';

final items3 = [
  {
    "image": "assets/images/NikeAirJordan_Orange.png",
    "title": "Best Seller",
    "tag": "Men's Shoes",
    "Name": "Nike Jordan",
    "price": "\$58.7",
    "color": [Color(0xff4EE8CC), Color(0xff92CAFF)]
  },
  {
    "image": "assets/images/shoes_4.png",
    "title": "Best Seller",
    "tag": "Men's Shoes",
    "Name": "Nike Air Max",
    "price": "\$37.8",
    "color": [Color(0xff4EE8CC), Color(0xff92CAFF)]
  },
  {
    "image": "assets/images/NikeClubMax.png",
    "title": "Best Seller",
    "tag": "Men's Shoes",
    "Name": "Nike Club Max",
    "price": "\$47.7",
    "color": [Color(0xff4EE8CC), Color(0xff92CAFF)]
  },
  {
    "image": "assets/images/NikeAirMax_Orangea_white.png",
    "title": "Best Seller",
    "tag": "Men's Shoes",
    "Name": "Nike Jordan",
    "price": "\$57.6",
    "colors": [Color(0xff4EE8CC), Color(0xff92CAFF)]
  },
  {
    "image": "assets/images/NikeAirMax_Orangea_white.png",
    "title": "Best Seller",
    "tag": "Men's Shoes",
    "Name": "Nike Jordan",
    "price": "\$57.6",
    "colors": [Color(0xff4EE8CC), Color(0xff92CAFF)]
  },
  {
    "image": "assets/images/NikeAirMax_Orangea_white.png",
    "title": "Best Seller",
    "tag": "Men's Shoes",
    "Name": "Nike Jordan",
    "price": "\$57.6",
    "colors": [Color(0xff4EE8CC), Color(0xff92CAFF)]
  }
];

Widget shoesOptions2() {
  return StatefulBuilder(
    builder: (context, setState) {
      return Expanded(
        child: GridView.builder(
          itemCount: items3.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 21,
            mainAxisSpacing: 20,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            final item = items3[index];
            final image = item['image'] as String;
            final title = item['title'] as String;
            final name = item['Name'] as String;
            final price = item['price'] as String;
            final tag = item['tag'] as String;
            final colors =
                (item['colors'] as List?)?.cast<Color>() ?? <Color>[];
            return Container(
              decoration: BoxDecoration(
                color: Color(0xff161F28),
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
                    Text(
                      tag,
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Text(
                        price,
                        style: GoogleFonts.poppins(
                          color: Colors.greenAccent,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                     Icon(Icons.fiber_manual_record,
                     color: AppColors.blue,
                       size: 20,
                     )
                    ])
                  ]),
            );
          },
        ),
      );
    },
  );
}
