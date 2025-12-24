import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utilities/colors.dart';

/// ---------------- DATA ----------------

final items = [
  {
    "image": "assets/images/NikeAirJordan_Orange.png",
    "title": "Best Seller",
    "Name": "Nike Jordan",
    "price": "\$58.7",
    "colors": [
      Color(0xFFFCF596),
      Color(0xFF67D4C4),
    ],
  },
  {
    "image": "assets/images/shoes_4.png",
    "title": "Best Seller",
    "Name": "Nike Air Max",
    "price": "\$37.8",
    "colors": [
      Color(0xFF5AA8FF),
      Color(0xFFFC4A1A),
    ],
  },
  {
    "image": "assets/images/NikeClubMax.png",
    "title": "Best Seller",
    "Name": "Nike Club Max",
    "price": "\$47.7",
    "colors": [
      Color(0xFF67D4C4),
      Color(0xFF93A3AD),
    ],
  },
  {
    "image": "assets/images/NikeAirMax_Orangea_white.png",
    "title": "Best Seller",
    "Name": "Nike Jordan",
    "price": "\$57.6",
    "colors": [
      Color(0xFFFC4A1A),
      Color(0xFFFCF596),
    ],
  },
];

final List<bool> likedItems =
List.generate(items.length, (_) => false);

/// ---------------- UI ----------------

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
      final colors = item['colors'] as List<Color>;
      final screenWidth = MediaQuery.of(context).size.width;

      return LayoutBuilder(
        builder: (context, constraints) {
          final cardWidth = constraints.maxWidth;
          final imageSize = cardWidth * 0.65;
          final titleSize = screenWidth * 0.028;
          final nameSize = screenWidth * 0.04;
          final priceSize = screenWidth * 0.035;

          return StatefulBuilder(
            builder: (context, setState) {
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
                           SizedBox(height: 8),
                          /// Image
                          Center(
                            child: Image.asset(
                              item['image'] as String,
                              height: imageSize,
                              fit: BoxFit.contain,
                            ),
                          ),
                           Spacer(),
                          /// Title
                          Text(
                            (item['title'] as String).toUpperCase(),
                            style: GoogleFonts.poppins(
                              color: Colors.blueAccent,
                              fontSize: titleSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                           SizedBox(height: 4),
                          Text(
                            item['Name'] as String,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: nameSize,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                           SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                item['price'] as String,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: priceSize,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                               Spacer(),
                              Row(
                                children: List.generate(
                                  colors.length,
                                      (i) => Container(
                                    margin: const EdgeInsets.only(left: 13),
                                    child: CircleAvatar(
                                      radius: 7,
                                      backgroundColor: colors[i],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    /// ❤️ Heart (ONLY clickable item)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            likedItems[index] = !likedItems[index];
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.06),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            likedItems[index]
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: likedItems[index]
                                ? Colors.red
                                : Colors.grey,
                            size: 16,
                          ),
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
    },
  );
}
