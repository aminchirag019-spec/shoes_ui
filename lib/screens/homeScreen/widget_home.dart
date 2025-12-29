import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/main.dart';
import 'package:task_1/router/router_class.dart';
import 'package:task_1/utilities/colors.dart';
import 'package:task_1/utilities/icons.dart';

import '../../utilities/media_query.dart';
import '../myCartScreen/widget_myscreen.dart';
import 'home_screen.dart';

Widget menuItem(
  BuildContext context,
  String icon,
  String title,
  String route,
) {
  return InkWell(
    borderRadius: BorderRadius.circular(12),
    onTap: () {
      ZoomDrawer.of(context)?.close();
      context.go(route);
    },
    child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: width(context) * 0.04,
      ),
      child: Row(
        children: [
          /// Icon
          ImageIcon(
            AssetImage(icon),
            size: width(context) * 0.07,
            color: AppColors.grey,
          ),

          SizedBox(width: width(context) * 0.04),

          /// Title
          Text(
            title,
            style: TextStyle(
              color: AppColors.white,
              fontSize: width(context) * 0.045, // responsive text
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget topBar({required BuildContext context, bool isOpen = false}) {
  final Color contentColor = isOpen ? AppColors.bg : AppColors.white;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: isOpen ? AppColors.white : AppColors.bg,
                borderRadius: BorderRadius.circular(30)),
            child: IconButton(
                onPressed: () => showModalBottomSheet(
                      context: context,
                      useRootNavigator: true,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => FilterSheet(),
                    ),
                icon: Icon(Icons.filter_list),
                color: isOpen ? AppColors.bg : AppColors.white)),
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
        IconButton(
            onPressed: () {},
            icon: Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: AppColors.bg,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ImageIcon(
                  AssetImage("assets/images/Frame.png"),
                  color: Colors.white,
                )))
      ],
    ),
  );
}

Widget searchBar({
  bool isOpen = false,
  required ValueChanged<String> onSearch,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      height: 55,
      decoration: BoxDecoration(
        color: isOpen ? Colors.white : AppColors.cardBg,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        onChanged: onSearch,
        style: TextStyle(
          color: isOpen ? Colors.black : Colors.white, // ✅ FIX
          fontSize: 16,
        ),
        cursorColor: isOpen ? Colors.black : Colors.white,
        decoration: InputDecoration(
          prefixIcon: const ImageIcon(
            AssetImage("assets/images/search.png"),
            color: Colors.grey,
          ),
          hintText: "Search for shoes",
          hintStyle: TextStyle(
            color: isOpen ? Colors.grey : Colors.white70,
          ),
          filled: true,
          fillColor: isOpen ? Colors.white : AppColors.cardBg,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ),
  );
}

final ValueNotifier<int> selectedBrandIndex = ValueNotifier<int>(-1);
Widget brandRow({
  bool isOpen = false,
  required ValueChanged<String> onBrandSelected,
}) {
  final brands = [
    {"name": "Nike", "icon": "assets/images/nike.png"},
    {"name": "Puma", "icon": "assets/images/Group 10.png"},
    {"name": "UA", "icon": "assets/images/Group 14.png"},
    {"name": "Adidas", "icon": "assets/images/Group 18.png"},
    {"name": "Converse", "icon": "assets/images/Group 23.png"},
  ];

  return SizedBox(
    height: 56,
    child: ValueListenableBuilder<int>(
      valueListenable: selectedBrandIndex, // ✅ FIX
      builder: (context, selected, _) {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemCount: brands.length,
          itemBuilder: (context, index) {
            final isSelected = selected == index;

            final containerColor = isSelected
                ? AppColors.blue
                : (isOpen ? AppColors.white : AppColors.chipBg);

            final iconCircleColor = isSelected
                ? AppColors.white
                : (isOpen ? AppColors.blue.withOpacity(0.1) : AppColors.bg);

            return GestureDetector(
              onTap: () {
                selectedBrandIndex.value = index; // ✅ updates UI
                onBrandSelected(brands[index]["name"]!); // ✅ filters
              },
              child: AnimatedContainer(
                duration:  Duration(milliseconds: 300),
                margin:  EdgeInsets.only(right: 5),
                padding:  EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(30),
                  border: isOpen && !isSelected
                      ? Border.all(
                          color: AppColors.blue.withOpacity(0.2),
                        )
                      : Border.all(color: Colors.transparent),
                ),
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 40,
                      width: width(context) * 0.11,
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

Widget sectionHeader(String title, BuildContext context,
    {bool isOpen = false}) {
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
        GestureDetector(
          onTap: () {
            context.go(RouterName.bestSellerScreen.path);
          },
          child: Text(
            "See all",
            style: GoogleFonts.roboto(color: Colors.blueAccent),
          ),
        )
      ],
    ),
  );
}

Widget popularShoes({
  bool isOpen = true,
  required List<Map<String, String>> shoes,
}) {
  return SizedBox(
    height: 220,
    child: ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      scrollDirection: Axis.horizontal,
      itemCount: shoes.length,
      itemBuilder: (context, index) {
        final item = shoes[index];

        return Container(
          width: width(context) * 0.42,
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: isOpen ? Colors.white : AppColors.cardBg,
            borderRadius: BorderRadius.circular(20),
          ),
          child: GestureDetector(
            onTap: () {
              context.go(RouterName.detailsScreen.path,
              extra: item
              );
            },
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(item["image"]!, height: 110),
                      const SizedBox(height: 10),
                      Text(
                        "BEST SELLER",
                        style: GoogleFonts.roboto(
                          color: AppColors.blue,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item["name"]!,
                        style: GoogleFonts.roboto(
                          color: isOpen ? Colors.black : Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item["price"]!,
                        style: GoogleFonts.roboto(
                          color: isOpen ? Colors.black54 : Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height:height(context)*0.05,
                    width:width(context)*0.1,
                    decoration:  BoxDecoration(
                      color: Color(0xFF5B9EFF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14),
                        bottomRight: Radius.circular(18),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        addToCart(item);

                        ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                            content: Text("Added to cart"),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      icon:  Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

void addToCart(Map<String, String> item) {
  final index = cart.indexWhere((e) => e["name"] == item["name"]);

  if (index != -1) {
    cart[index]["count"]++;
  } else {
    cart.add({
      "image": item["image"],
      "name": item["name"],
      "price": item["price"],
      "size": "L",
      "count": 1,
    });
  }
}

Widget newArrivalCard({
  bool isOpen = false,
  required List<Map<String, String>> shoes,
}) {
  if (shoes.isEmpty) {
    return const SizedBox.shrink();
  }

  final item = shoes.first;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      height:160,
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
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BEST CHOICE",
                    style: GoogleFonts.roboto(
                      color: AppColors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   SizedBox(height: 5),
                  Text(
                    item["name"]!,
                    style: GoogleFonts.roboto(
                      color: isOpen ? Colors.black : Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item["price"]!,
                    style: GoogleFonts.roboto(
                      color: isOpen ? Colors.black54 : Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(item["image"]!, height: 100),
          const SizedBox(width: 10),
        ],
      ),
    ),
  );
}

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  static const String _defaultGender = "Men";
  static const String _defaultSize = "US 5.5";
  static const RangeValues _defaultRange = RangeValues(16, 159);

  String selectedGender = _defaultGender;
  String selectedSize = _defaultSize;
  RangeValues _currentRangeValues = _defaultRange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF1D2935), // Dark background from image
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Handle
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 20),

          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 50), // Spacer
              Text("Filters",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedGender = _defaultGender;
                    selectedSize = _defaultSize;
                    _currentRangeValues = _defaultRange;
                  });
                },
                child: Text("RESET",
                    style: TextStyle(color: Colors.grey, fontSize: 14)),
              )
            ],
          ),
          SizedBox(height: 20),

          // Gender Section
          Text("Gender",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 15),
          Row(
            children: [
              _buildChoiceChip("Men"),
              SizedBox(width: 10),
              _buildChoiceChip("Women"),
              SizedBox(width: 10),
              _buildChoiceChip("Unisex"),
            ],
          ),
          SizedBox(height: 25),

          // Size Section
          Text("Size",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildSizeChip("UK 4.4"),
                SizedBox(width: 10),
                _buildSizeChip("US 5.5"),
                SizedBox(width: 10),
                _buildSizeChip("UK 6.5"),
                SizedBox(width: 10),
                _buildSizeChip("EU 11.5"),
              ],
            ),
          ),
          SizedBox(height: 25),

          // Price Section
          Text("Price",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          RangeSlider(
            values: _currentRangeValues,
            min: 0,
            max: 500,
            activeColor: AppColors.blue,
            inactiveColor: Colors.white12,
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${_currentRangeValues.start.round()}",
                  style: TextStyle(color: Colors.grey)),
              Text("\$${_currentRangeValues.end.round()}",
                  style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 30),

          // Apply Button
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () => Navigator.pop(context),
              child: Text("Apply",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildChoiceChip(String label) {
    bool isSelected = selectedGender == label;
    return GestureDetector(
      onTap: () => setState(() => selectedGender = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.blue : Color(0xFF15202B),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(label,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontWeight: FontWeight.w500)),
      ),
    );
  }

  Widget _buildSizeChip(String label) {
    bool isSelected = selectedSize == label;
    return GestureDetector(
      onTap: () => setState(() => selectedSize = label),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.blue : Color(0xFF15202B),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(label,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}

void openFilterSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => FilterSheet(),
  );
}
