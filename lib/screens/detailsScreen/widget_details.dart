import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/screens/homeScreen/widget_home.dart';

import '../../router/router_class.dart' show RouterName;
import '../../utilities/colors.dart';
import '../../utilities/icons.dart';
import '../myCartScreen/widget_myscreen.dart';
import '../widgets/app_bar.dart';

final List<String> galleryOwners = [
  'assets/images/Imag.png',
  'assets/images/NikeClubMaxPurple.png',
  'assets/images/NikeAirJordan_Orange.png',
];

final Map<int, List<String>> ownerLookbooks = {
  0: ['assets/images/Imag.png', 'assets/images/NikeClubMaxBlue.png'],
  1: ['assets/images/NikeClubMaxPurple.png', 'assets/images/NikeClubMax.png'],
  2: [
    'assets/images/NikeAirJordan_Orange.png',
    'assets/images/NikeAirMax_Orangea_white.png'
  ],
};

Widget upperRow(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
          onPressed: () {
            context.go(RouterName.homeScreen.path);
          },
          icon: iconBox(
            GIcons.back,
          )),
      Text(
        "Men's Shoes",
        style: GoogleFonts.poppins(
          color: Colors.white70,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      IconButton(
          onPressed: () => context,
          icon: Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
                color: AppColors.bg, borderRadius: BorderRadius.circular(30)),
            child: ImageIcon(
              AssetImage(
                "assets/images/Frame.png",
              ),
              color: AppColors.white,
            ),
          ))
    ],
  );
}

int activeOwnerIndex = 0;
final sizes = [38, 39, 40, 41, 42, 43];
int selectedSize = 40;
final PageController pageController = PageController(viewportFraction: 0.86);

Widget mainShoes() {
  return SizedBox(
    height: 300,
    child: PageView.builder(
      key: ValueKey(activeOwnerIndex),
      controller: pageController,
      itemCount: ownerLookbooks[activeOwnerIndex]?.length ?? 0,
      itemBuilder: (context, index) {
        final images = ownerLookbooks[activeOwnerIndex]!;
        return Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Image.asset(
            images[index],
            fit: BoxFit.contain,
          ),
        );
      },
    ),
  );
}

Widget gallery(VoidCallback onUpdate) {
  return StatefulBuilder(builder: (context, setState) {
    return SizedBox(
      height: 68,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: galleryOwners.length,
        separatorBuilder: (_, __) =>  SizedBox(width: 12),
        itemBuilder: (context, i) {
          final isActive = activeOwnerIndex == i;

          return GestureDetector(
            onTap: () {
              setState(() {
                activeOwnerIndex = i;
              });
              pageController.jumpToPage(0);
              onUpdate();
            },
            child: AnimatedContainer(
              duration:  Duration(milliseconds: 200),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: isActive ? Color(0xFF11343D) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: isActive
                    ? Border.all(color: AppColors.accent, width: 2)
                    : Border.all(color: Colors.white10),
              ),
              child: Image.asset(galleryOwners[i], width: 56),
            ),
          );
        },
      ),
    );
  });
}

Widget sizeRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('Size',
          style: GoogleFonts.poppins(
              color: Colors.white70, fontWeight: FontWeight.w600)),
      Row(children: [
        Text('EU',
            style: GoogleFonts.poppins(color: Colors.white54, fontSize: 12)),
         SizedBox(width: 8),
        Text('US',
            style: GoogleFonts.poppins(color: Colors.white54, fontSize: 12)),
         SizedBox(width: 8),
        Text('UK',
            style: GoogleFonts.poppins(color: Colors.white54, fontSize: 12)),
      ])
    ],
  );
}

Widget choiceChip() {
  return StatefulBuilder(
    builder: (context, setState) {
      return Wrap(
        spacing: 10,
        children: sizes.map((s) {
          final active = s == selectedSize;
          return ChoiceChip(
            showCheckmark: false,
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 15),
            labelPadding: const EdgeInsets.symmetric(horizontal: 8),
            label: Text('$s',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: active ? Colors.white : Color(0xff707B81),
                )),
            selected: active,
            selectedColor: AppColors.accent,
            backgroundColor: Color(0xff1A2530),
            side: BorderSide.none,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onSelected: (_) {
              setState(() => selectedSize = s);
            },
          );
        }).toList(),
      );
    },
  );
}

Widget ratings() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      featureBox(Icons.star, '4.8'),
      featureBox(Icons.local_fire_department, 'Best Seller'),
      featureBox(Icons.check_circle, 'Authentic'),
    ],
  );
}

Widget featureBox(IconData icon, String label) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    decoration: BoxDecoration(
        color: const Color(0xFF071B20),
        borderRadius: BorderRadius.circular(12)),
    child: Row(children: [
      Icon(icon, color: Colors.white70, size: 18),
      const SizedBox(width: 8),
      Text(label, style: GoogleFonts.poppins(color: Colors.white70))
    ]),
  );
}

Widget buildBottomBar(BuildContext context) {
  return BottomAppBar(
    color: const Color(0xFF07151A),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: GoogleFonts.poppins(color: Colors.white60),
                ),
                const SizedBox(height: 6),
                Text(
                  currentItem["price"]!, // ✅ FIXED
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: () {
              addToCart(currentItem);

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text("Added to cart"),
                    duration: Duration(seconds: 1),
                  ),
                );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accent,
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            child: Text(
              'Add To Cart',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

final Map<String, String> currentItem = {
  "image": "assets/images/NikeAirJordan_Orange.png",
  "name": "Nike Air Jordan",
  "price": "\$849.69",
  "size": "40",
};
void addToCart(Map<String, String> item) {
  final index = cart.indexWhere((e) => e["name"] == item["name"]);

  if (index != -1) {
    cart[index]["count"]++;
  } else {
    cart.add({
      "image": item["image"],
      "name": item["name"],
      "price": item["price"],
      "size": item["size"],
      "count": 1,
    });
  }
}
