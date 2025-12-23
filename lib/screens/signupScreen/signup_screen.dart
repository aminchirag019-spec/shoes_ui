import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/router/router_class.dart';
import 'package:task_1/screens/signupScreen/widget_signup.dart';
import 'package:task_1/screens/widgets/app_bar.dart';

class Signupscreen extends StatelessWidget {
  Signupscreen({super.key});








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A2530),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 18,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    IconButton(onPressed:() {
                      context.go(RouterName.loginScreen.path);
                    }, icon: iconBox(Icons.arrow_back_ios))

                  ],
                ),
              ),
              Form(
                key: formkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Create Account!",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Let's Create Account Together!",
                            style: GoogleFonts.poppins(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
              
                    SizedBox(height: 50),
              
                    // Name Field
                    Text(
                      "Your Name",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    nameField(),
                    SizedBox(height: 20),
              
                    // Email Field
                    Text(
                      "Email Address",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    emailField(),
                    const SizedBox(height: 20),
                    // Password Field
                    Text(
                      "Password",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    passwordField(),
                    const SizedBox(height: 10),
                    SizedBox(height: 40),
                    // Sign In Button
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child:
                        signinButton(context)
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                      "assets/images/Button.png",
                      height: 60,
                      width:600,
                      fit: BoxFit.fill,
                    ),
              
                    SizedBox(height: 100),
              
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: "Already Have An Account? ",
                          style: GoogleFonts.poppins(
                            color: Colors.white54,
                            fontSize: 13,
                          ),
                          children: [
                            TextSpan(
                              text: "Sign In",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
