import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/screens/detailsScreen/widget_details.dart';
import 'package:task_1/utilities/colors.dart';
import 'package:task_1/utilities/icons.dart';

import '../widgets/app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
final formkey =GlobalKey<FormState>();


class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.chipBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed:() {
                    context.go('/HomeScreen');
                  },
                      icon:iconBox(GIcons.back,)
                  ),
                  Text(
                    "Profile",
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(onPressed:() => context,
                      icon: ImageIcon(AssetImage("assets/images/edit.png",),color: AppColors.blue,))
                ],
              ),
              SizedBox(height: 15,),
              Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                   CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/alissonbecker.png"),
                  ),

                  Positioned(
                    bottom: -9,
                    child: Container(
                      padding:  EdgeInsets.all(6),
                      decoration:  BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        GIcons.camera,
                        size: 18,
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                ],
              ),
               SizedBox(height: 15),
               Text(
                "Alisson Becker",
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text(
                      "Full  Name",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                     SizedBox(height: 8),
                    TextFormField(
                      style: const TextStyle(color: AppColors.white),
                      decoration: InputDecoration(
                        hintText: "Alisson Becker",
                        hintStyle: const TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor:  Color(0xFF161F28),
                        contentPadding:  EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Email Field
                    Text(
                      "Email Address",
                      style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 14,
                      ),
                    ),
                     SizedBox(height: 8),
                    TextFormField(
                      style:  TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "alissonbecker@gmail.com",
                        hintStyle:  TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor:  Color(0xFF161F28),
                        contentPadding:  EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                     SizedBox(height: 20),
                    Text(
                      "Password",
                      style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 14,
                      ),
                    ),
                     SizedBox(height: 8),
                    TextFormField(
                      style:  TextStyle(color:AppColors.white),
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle:  TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor:  Color(0xFF161F28),
                        contentPadding:  EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
