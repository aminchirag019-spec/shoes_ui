import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/router/router_class.dart';
import 'package:task_1/utilities/colors.dart';
import 'package:task_1/utilities/icons.dart';

// 1. Converted to a Class for proper context handling
Widget drawer() {
  return StatefulBuilder(
    builder: (context, setState) {
      return Scaffold(
        backgroundColor: AppColors.chipBg,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage("assets/images/alissonbecker.png"),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Hey, 👋",
                  style: TextStyle(
                    color: Color(0xFF707B81),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Alisson Becker",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                menuItem(context, "assets/images/user.png", "Profile",
                    '/ProfileScreen'),
                menuItem(context, "assets/images/home .png", "Home Page",
                    '/HomeScreen'),
                menuItem(context, "assets/images/Frame.png", "My Cart",
                    '/MycartScreen'),
                menuItem(context, "assets/images/Heart.png", "Favourite",
                    '/FavouriteScreen'),
                menuItem(context, "assets/images/FastDelivery.png", "Orders",
                    '/CheckoutScreen'),
                menuItem(context, "assets/images/Notifications.png",
                    "Notifications", '/NotificationScreen'),
                const Spacer(),
                Divider(color: AppColors.white),
                const SizedBox(height: 30),
                menuItem(context, "assets/images/Signout.png", "Sign Out",
                    '/LoginScreen'),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget menuItem(BuildContext context, String icon, String title, String route) {
  return InkWell(
    onTap: () {
      // Close first, then navigate
      ZoomDrawer.of(context)?.close();
      context.go(route);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(icon),
            size: 30,
            color: AppColors.grey,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget topBar({VoidCallback? iconbutton, bool isOpen = false}) {
  final Color contentColor = isOpen ? Colors.black : Colors.white;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              color:isOpen ? Colors.white : AppColors.bg,
            borderRadius: BorderRadius.circular(30)
          ),
          child: IconButton(
              onPressed: iconbutton,
              icon: ImageIcon(
                const AssetImage("assets/images/apps-circle.png"),
                color: contentColor,
              )),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Store location",
              style: GoogleFonts.roboto(
                color: isOpen ? Colors.black54 : Colors.white70,
                fontSize: 13,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.red, size: 16),
                const SizedBox(width: 4),
                Text(
                  "Mondolibug, Sylhet",
                  style: GoogleFonts.roboto(
                    color: contentColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: AppColors.bg,
            borderRadius: BorderRadius.circular(30)
          ),
          child: ImageIcon(
            const AssetImage("assets/images/Frame.png"),
            size: 30,
            color: contentColor,
          ),
        )
      ],
    ),
  );
}

Widget searchBar({bool isOpen = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      height: 55,
      decoration: BoxDecoration(
        color: isOpen ? Colors.white : AppColors.cardBg,
        borderRadius: BorderRadius.circular(30),
        boxShadow: isOpen
            ? [BoxShadow(color: Colors.grey.withOpacity(0.0), blurRadius: 10)]
            : [],
      ),
          child: TextField(
            autofocus: false,
            style: TextStyle(color: isOpen ? Colors.black : Colors.white),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search_rounded, color: isOpen ? Colors.black54 : Colors.white54),
              hintText: "Looking for shoes",
              hintStyle: GoogleFonts.roboto(
                  color: isOpen ? Colors.black38 : Colors.white54),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none
              )
            ),
          ),

    ),
  );
}
Widget brandRow({bool isOpen = false}) {
  final ValueNotifier<int> selectedBrandIndex = ValueNotifier(0);
  final brands = [
    {"name": "Nike", "icon": "assets/images/nike.png"},
    {"name": "Puma", "icon": "assets/images/Group 10.png"},
    {"name": "UA", "icon": "assets/images/Group 14.png"},
    {"name": "Adidas", "icon": "assets/images/Group 10.png"},
    {"name": "Converse", "icon": "assets/images/Group 23.png"},
  ];

  return SizedBox(
    height: 56,
    child: ValueListenableBuilder<int>(
      valueListenable: selectedBrandIndex,
      builder: (context, selected, _) {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemCount: brands.length,
          itemBuilder: (context, index) {
            final isSelected = index == selected;


            Color containerColor;
            if (isSelected) {
              containerColor = AppColors.blue;
            } else {
              containerColor = isOpen ? AppColors.white : AppColors.chipBg;
            }

            Color iconCircleColor;
            if (isSelected) {
              iconCircleColor = AppColors.white;
            } else {
              iconCircleColor = isOpen ? AppColors.blue.withOpacity(0.1) : AppColors.bg;
            }

            return GestureDetector(
              onTap: () => selectedBrandIndex.value = index,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.only(right: 5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(30),
                  border: isOpen && !isSelected
                      ? Border.all(color: AppColors.blue.withOpacity(0.2))
                      : Border.all(color: Colors.transparent),
                ),
                child: Row(
                  children: [
                    AnimatedContainer( // Animate the icon circle color
                      duration: const Duration(milliseconds: 300),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: iconCircleColor,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Image.asset(
                        brands[index]["icon"]!,
                        color: isSelected
                            ? AppColors.bg
                            : (isOpen ? AppColors.blue : Colors.white),
                        fit: BoxFit.contain,
                      ),
                    ),

                    if (isSelected || isOpen) ...[
                      const SizedBox(width: 10),
                      Text(
                        brands[index]["name"]!,
                        style: GoogleFonts.roboto(
                          color: isSelected ? Colors.white : AppColors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
  );
}





Widget sectionHeader(String title, {bool isOpen = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.roboto(
            color: isOpen ? Colors.black : Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "See all",
          style: GoogleFonts.roboto(color: Colors.blueAccent),
        ),
      ],
    ),
  );
}

Widget popularShoes({bool isOpen = false}) {
  final items = [
    {
      "name": "Nike Jordan",
      "price": "\$493.00",
      "image": "assets/images/shoes_1.png"
    },
    {
      "name": "Nike Air Max",
      "price": "\$897.99",
      "image": "assets/images/shoes_2.png"
    },
    {
      "name": "Nike Air Max",
      "price": "\$897.99",
      "image": "assets/images/shoes_2.png"
    }
  ];

  return SizedBox(
    height: 220,
    child: ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          width: 180,
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: isOpen ? Colors.white : AppColors.cardBg,
            borderRadius: BorderRadius.circular(20),
            boxShadow: isOpen
                ? [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1), blurRadius: 10)
                  ]
                : [],
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(item["image"]!, height: 110),
                    SizedBox(height: 10),
                    Text(
                      "BEST SELLER",
                      style: GoogleFonts.roboto(
                          color: AppColors.blue,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Text(
                      item["name"]!,
                      style: GoogleFonts.roboto(
                          color: isOpen ? Colors.black : Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Text(
                      item["price"]!,
                      style: GoogleFonts.roboto(
                          color: isOpen ? Colors.black54 : Colors.white70),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 44,
                  width: 44,
                  decoration: const BoxDecoration(
                    color: Color(0xFF5B9EFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      bottomRight: Radius.circular(18),
                    ),
                  ),
                  child: IconButton(onPressed:() {
                    context.go(RouterName.detailsScreen.path);
                  },
                      icon:Icon(Icons.add,
                    color: Colors.white,
                    size: 24,)
                ),
              )
              )
            ],
          ),
        );
      },
    ),
  );
}

Widget newArrivalCard({bool isOpen = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      height: 170,
      decoration: BoxDecoration(
        color: isOpen ? Colors.white : AppColors.cardBg,
        borderRadius: BorderRadius.circular(20),
        boxShadow: isOpen
            ? [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10)]
            : [],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("BEST CHOICE",
                      style: GoogleFonts.roboto(
                          color: AppColors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text("Nike Air Jordan",
                      style: GoogleFonts.roboto(
                          color: isOpen ? Colors.black : Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("\$849.69",
                      style: GoogleFonts.roboto(
                          color: isOpen ? Colors.black54 : Colors.white70,
                          fontSize: 16)),
                ],
              ),
            ),
          ),
          Image.asset("assets/images/shoes_3.png", height: 100),
          SizedBox(width: 10),
        ],
      ),
    ),
  );
}
