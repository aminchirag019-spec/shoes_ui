import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/router/router_class.dart';
import 'package:task_1/screens/myCartScreen/widget_myscreen.dart';
import 'package:task_1/utilities/media_query.dart';

import '../../utilities/colors.dart';
import '../widgets/app_bar.dart';

class MycartScreen extends StatefulWidget {
  const MycartScreen({super.key});

  @override
  State<MycartScreen> createState() => _MycartScreenState();
}

class _MycartScreenState extends State<MycartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A2530),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.go(RouterName.homeScreen.path);
                    },
                    icon: iconBox(Icons.arrow_back_ios),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Text(
                      "My Cart",
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            optionShoes(),
            Container(
              height: height(context)*0.36,
              width: width(context),
              decoration: BoxDecoration(
                color: AppColors.bg,
                borderRadius: BorderRadius.circular(30),
              ),
              child: bottomRows(),
            ),
          ],
        ),
      ),
    );
  }
}
