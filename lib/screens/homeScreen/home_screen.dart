// lib/screens/homeScreen/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:task_1/screens/homeScreen/widget_home.dart';
import 'package:task_1/utilities/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  String searchText = "";
  String selectedBrand = "";

  List<Map<String, String>> filteredShoes = [];

  final List<Map<String, String>> allShoes = [
    {
      "name": "Nike Jordan",
      "price": "₹493.00",
      "image": "assets/images/NikeAirJordan_Orange.png",
    },
    {
      "name": "Nike Air Max",
      "price": "₹897.99",
      "image": "assets/images/shoes_2.png"
    },
    {
      "name": "Puma RS-X",
      "price": "₹699.00",
      "image": "assets/images/shoes_1.png"
    },
    {
      "name": "Puma RS-Y",
      "price": "₹699.00",
      "image": "assets/images/shoes_1.png"
    },
    {
      "name": "Puma RS-Z",
      "price": "₹699.00",
      "image": "assets/images/shoes_1.png"
    },
    {
      "name": "Puma RS-A",
      "price": "₹699.00",
      "image": "assets/images/shoes_1.png"
    },
    {
      "name": "UA 121D",
      "price":"₹700.00",
      "image":"assets/images/NikeClubMax.png",
    },

    {
      "name": "UA 121D",
      "price":"₹700.00",
      "image":"assets/images/NikeClubMax.png",
    },

    {
      "name": "UA 121D",
      "price":"₹700.00",
      "image":"assets/images/NikeClubMax.png",
    },
    {
      "name": "Adidas 121D",
      "price":"₹700.00",
      "image":"assets/images/NikeClubMax.png",
    },

    {
      "name": "Adidas 122D",
      "price":"₹700.00",
      "image":"assets/images/NikeClubMax.png",
    },

    {
      "name": "Adidas 121D",
      "price":"₹700.00",
      "image":"assets/images/NikeClubMax.png",
    },

    {
      "name": "converse 121D",
      "price":"₹700.00",
      "image":"assets/images/NikeAirMax_Orangea_white.png",
    },

    {
      "name": "converse 121D",
      "price":"₹700.00",
      "image":"assets/images/NikeAirMax_Orangea_white.png",
    },
    {
      "name": "converse 121D",
      "price":"₹700.00",
      "image":"assets/images/NikeAirMax_Orangea_white.png",
    },
    {
      "name": "converse 121D",
      "price":"₹700.00",
      "image":"assets/images/NikeAirMax_Orangea_white.png",
    },
    {
      "name": "converse 121D",
      "price":"₹700.00",
      "image":"assets/images/NikeAirMax_Orangea_white.png",
    }

  ];

  @override
  void initState() {
    super.initState();
    filteredShoes = List.from(allShoes);
  }
  void applyFilters() {
    setState(() {
      filteredShoes = allShoes.where((shoe) {
        final name = shoe["name"]!.toLowerCase();

        final matchesSearch =
            searchText.isEmpty || name.contains(searchText);

        final matchesBrand =
            selectedBrand.isEmpty || name.contains(selectedBrand);

        return matchesSearch && matchesBrand;
      }).toList();
    });
  }

  void onSearchChanged(String value) {
    searchText = value.toLowerCase();
    applyFilters();
  }

  void onBrandSelected(String brand) {
    selectedBrand = brand.toLowerCase();
    applyFilters();
  }

  @override
  Widget build(BuildContext context) {
    final drawerController = ZoomDrawer.of(context);

    if (drawerController == null) {
      return const Scaffold(
        body: Center(child: Text("ZoomDrawer not found")),
      );
    }

    return ValueListenableBuilder<DrawerState>(
      valueListenable: drawerController.stateNotifier,
      builder: (context, state, child) {
        final bool isOpen = state == DrawerState.open;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          color: isOpen ? AppColors.white : AppColors.chipBg,
          child: Scaffold(
            extendBody: true,
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  topBar(context: context),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 120),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           SizedBox(height: 20),
                          searchBar(
                            onSearch: onSearchChanged,
                            isOpen: isOpen,
                          ),
                           SizedBox(height: 20),
                          brandRow(
                            isOpen: isOpen,
                            onBrandSelected: onBrandSelected,
                          ),
                           SizedBox(height: 20),
                          sectionHeader(
                            "Popular Shoes",
                            context,
                            isOpen: isOpen,
                          ),
                           SizedBox(height: 12),
                          popularShoes(
                            isOpen: isOpen,
                            shoes: filteredShoes,
                          ),
                           SizedBox(height: 20),
                          newArrivalCard(
                            isOpen: isOpen,
                            shoes: filteredShoes,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
