import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/utilities/media_query.dart';

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
Widget shoesOptions() {
  return GridView.builder(
    itemCount: items.length,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 0.72,
    ),
    itemBuilder: (context, index) {
      final item = items[index];
      final screenWidth = MediaQuery.of(context).size.width;

      return LayoutBuilder(
        builder: (context, constraints) {
          final cardWidth = constraints.maxWidth;
          final imageSize = cardWidth * 0.65;
          final titleSize = screenWidth * 0.028;
          final nameSize = screenWidth * 0.04;
          final priceSize = screenWidth * 0.035;

          return Container(
            decoration: BoxDecoration(
              color: AppColors.bg,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),

                      /// Product Image
                      Center(
                        child: Image.asset(
                          item['image']!,
                          height: imageSize,
                          fit: BoxFit.contain,
                        ),
                      ),

                      const Spacer(),

                      /// Best Seller
                      Text(
                        item['title']!.toUpperCase(),
                        style: GoogleFonts.poppins(
                          color: Colors.blueAccent,
                          fontSize: titleSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 4),

                      /// Product Name
                      Text(
                        item['Name']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: nameSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// Price + Colors
                      Row(
                        children: [
                          Text(
                            item['price']!,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: priceSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          const CircleAvatar(
                            radius: 6,
                            backgroundColor: Color(0xFFFCF596),
                          ),
                          const SizedBox(width: 6),
                          const CircleAvatar(
                            radius: 6,
                            backgroundColor: Color(0xFF67D4C4),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// Favorite Icon
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.06),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.redAccent,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
