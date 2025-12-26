import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/router/router_class.dart';
import 'package:task_1/screens/favoriteScreen/widget_favourite.dart';
import 'package:task_1/utilities/colors.dart';
import 'package:task_1/utilities/icons.dart';

import '../widgets/app_bar.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}


class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        context.go(RouterName.homeScreen.path);
      return false;
        },
      child: Scaffold(
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
                      context.go(RouterName.homeScreen.path);
                    },
                        icon:iconBox(GIcons.back,)
                        ),
                    Text(
                      "Favourite",
                      style: GoogleFonts.poppins(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                   IconButton(onPressed:() => context,
                       icon: Container(
                         height: 44,
                         width: 44,
                         decoration: BoxDecoration(
                           color: AppColors.bg,
                           borderRadius: BorderRadius.circular(30)
                         ),
                         child:ImageIcon(AssetImage("assets/images/Frame.png",),color: AppColors.white,),
                       ))
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(child:shoesOptions())

              ],
            ),
          ),
        ),
      ),
    );
  }
}
