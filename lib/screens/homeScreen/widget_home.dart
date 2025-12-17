import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/utilities/colors.dart';
import 'package:task_1/utilities/icons.dart';

// 1. Converted to a Class for proper context handling
Widget drawer(){
  return StatefulBuilder(builder: (context, setState) {
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
                backgroundImage: AssetImage("assets/images/alissonbecker.png"),
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
              menuItem(context, "assets/images/user.png", "Profile", '/ProfileScreen'),
              menuItem(context, "assets/images/home .png", "Home Page", '/HomeScreen'),
              menuItem(context, "assets/images/Frame.png", "My Cart", '/MycartScreen'),
              menuItem(context, "assets/images/Heart.png", "Favourite", '/FavouriteScreen'),
              menuItem(context, "assets/images/FastDelivery.png", "Orders", '/CheckoutScreen'),
              menuItem(context, "assets/images/Notifications.png", "Notifications", '/NotificationScreen'),
              const Spacer(),
              Divider(color: AppColors.white),
              const SizedBox(height: 30),
              menuItem(context, "assets/images/Signout.png", "Sign Out", '/LoginScreen'),
            ],
          ),
        ),
      ),
    );
  },);
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
            const SizedBox(width: 15),
            Text(
              title,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
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
        IconButton(
            onPressed: iconbutton,
            icon: ImageIcon(
              const AssetImage("assets/images/apps-circle.png"),
              color: contentColor,
            )),
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
        ImageIcon(
          const AssetImage("assets/images/Frame.png"),
          size: 30,
          color: contentColor,
        )
      ],
    ),
  );
}

Widget searchBar({bool isOpen = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      height: 50,
      decoration: BoxDecoration(
        color: isOpen ? Colors.white : AppColors.cardBg,
        borderRadius: BorderRadius.circular(14),
        boxShadow: isOpen
            ? [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10)]
            : [],
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Icon(Icons.search, color: isOpen ? Colors.black54 : Colors.white54),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              style: TextStyle(color: isOpen ? Colors.black : Colors.white),
              decoration: InputDecoration(
                hintText: "Looking for shoes",
                hintStyle: GoogleFonts.roboto(
                    color: isOpen ? Colors.black38 : Colors.white54),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget brandRow({bool isOpen = false}) {
  final brands = ["Nike", "Puma", "UA", "Adidas", "Converse"];

  return SizedBox(
    height: 50,
    child: ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      scrollDirection: Axis.horizontal,
      itemCount: brands.length,
      itemBuilder: (context, index) {
        final isSelected = index == 0;
        return Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.blue
                : (isOpen ? Colors.white : AppColors.chipBg),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    brands[index][0],
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                brands[index],
                style: GoogleFonts.roboto(
                  color: isSelected
                      ? Colors.white
                      : (isOpen ? Colors.black : Colors.white),
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
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
    {"name": "Nike Jordan", "price": "\$493.00", "image": "assets/images/shoes_1.png"},
    {"name": "Nike Air Max", "price": "\$897.99", "image": "assets/images/shoes_2.png"},
    {"name": "Nike Air Max", "price": "\$897.99", "image": "assets/images/shoes_2.png"}
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
                ? [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10)]
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
                          color: AppColors.blue, fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                     SizedBox(height: 6),
                    Text(
                      item["name"]!,
                      style: GoogleFonts.roboto(
                          color: isOpen ? Colors.black : Colors.white,
                          fontSize: 16, fontWeight: FontWeight.bold),
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
                bottom: 10,
                right: 10,
                child: Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(GIcons.add, color: Colors.white, size: 22),
                ),
              ),
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
      height: 150,
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
                          color: AppColors.blue, fontSize: 15, fontWeight: FontWeight.bold)),
                   SizedBox(height: 6),
                  Text("Nike Air Jordan",
                      style: GoogleFonts.roboto(
                          color: isOpen ? Colors.black : Colors.white,
                          fontSize: 25, fontWeight: FontWeight.bold)),
                   SizedBox(height: 8),
                  Text("\$849.69",
                      style: GoogleFonts.roboto(
                          color: isOpen ? Colors.black54 : Colors.white70, fontSize: 16)),
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
