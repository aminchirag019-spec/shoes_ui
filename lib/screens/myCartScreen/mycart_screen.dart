import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/screens/favoriteScreen/favourite_screen.dart';
import 'package:task_1/screens/myCartScreen/widget_myscreen.dart';

import '../../utilities/colors.dart';

class MycartScreen extends StatefulWidget {
  const MycartScreen({super.key});

  @override
  State<MycartScreen> createState() => _MycartScreenState();
}



class _MycartScreenState extends State<MycartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A2530),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  IconButton(onPressed:() {
                    context.push('/HomeScreen');
                  },
                      icon: iconBox(Icons.arrow_back)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Text(
                      "My Cart",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
           optionShoes(),
            Column(
              children: [
                   Container(
                    height: 300,
                    width:410,
                    decoration: BoxDecoration(
                      color: AppColors.bg,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: bottomRows(),
                  ),

              ],
            )
          ],
        ),
      ),
    );
  }
}

