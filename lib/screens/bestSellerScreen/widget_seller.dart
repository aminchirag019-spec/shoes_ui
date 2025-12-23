import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/utilities/media_query.dart';

import '../../utilities/colors.dart';
import '../favoriteScreen/widget_favourite.dart';

final items3 = [
  {
    "image": "assets/images/NikeAirJordan_Orange.png",
    "title": "Best Seller",
    "tag": "Men's Shoes",
    "Name": "Nike Jordan",
    "price": "\$583.7",
    "color": [Color(0xff4EE8CC), Color(0xff92CAFF)]
  },
  {
    "image": "assets/images/shoes_4.png",
    "title": "Best Seller",
    "tag": "Men's Shoes",
    "Name": "Nike Air Max",
    "price": "\$373.8",
    "color": [Color(0xff4EE8CC), Color(0xff92CAFF)]
  },
  {
    "image": "assets/images/NikeClubMax.png",
    "title": "Best Seller",
    "tag": "Men's Shoes",
    "Name": "Nike Club Max",
    "price": "\$473.7",
    "color": [Color(0xff4EE8CC), Color(0xff92CAFF)]
  },
  {
    "image": "assets/images/NikeAirMax_Orangea_white.png",
    "title": "Best Seller",
    "tag": "Men's Shoes",
    "Name": "Nike Jordan",
    "price": "\$573.6",
    "colors": [Color(0xff4EE8CC), Color(0xff92CAFF)]
  },
  {
    "image": "assets/images/NikeAirMax_Orangea_white.png",
    "title": "Best Seller",
    "tag": "Men's Shoes",
    "Name": "Nike Jordan",
    "price": "\$573.6",
    "colors": [Color(0xff4EE8CC), Color(0xff92CAFF)]
  },
  {
    "image": "assets/images/NikeAirMax_Orangea_white.png",
    "title": "Best Seller",
    "tag": "Men's Shoes",
    "Name": "Nike Jordan",
    "price": "\$573.6",
    "colors": [Color(0xff4EE8CC), Color(0xff92CAFF)]
  }
];
Widget shoesOptions2() {
  return Expanded(
    child: GridView.builder(
      itemCount: items3.length,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final item = items3[index];
        final image = item['image'] as String;
        final title = item['title'] as String;
        final name = item['Name'] as String;
        final price = item['price'] as String;
        final tag = item['tag'] as String;

        return Container(
          decoration: BoxDecoration(
            color: const Color(0xff161F28),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image (responsive)
              Expanded(
                flex: 3,
                child: Center(
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              /// Title
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF5B9EE1),
                  fontSize: width(context) * 0.035,
                ),
              ),

              /// Name
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: width(context) * 0.042,
                  fontWeight: FontWeight.w600,
                ),
              ),

              /// Tag
              Text(
                tag,
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: width(context) * 0.032,
                ),
              ),

              const SizedBox(height: 6),

              /// Price + Colors
              Row(
                children: [
                  Text(
                    price,
                    style: GoogleFonts.poppins(
                      color: Colors.greenAccent,
                      fontSize: width(context) * 0.036,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.fiber_manual_record,
                    color: AppColors.blue,
                    size: width(context) * 0.045,
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.fiber_manual_record,
                    color: Colors.green,
                    size: width(context) * 0.045,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ),
  );
}

