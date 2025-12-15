import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/screens/favoriteScreen/widget_favourite.dart';
import 'package:task_1/utilities/colors.dart';
import 'package:task_1/utilities/icons.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}


class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A2530),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed:() {
                    context.go('/HomeScreen');
                  },
                      icon:iconBox(GIcons.back),),
                  Text(
                    "Favourite",
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  iconBox(Icons.shopping_bag_outlined),
                ],
              ),
              const SizedBox(height: 12),
              // GridView inside Column: make it shrink and non-scrollable
              shoesOptions()
            ],
          ),
        ),
      ),
    );
  }
}
