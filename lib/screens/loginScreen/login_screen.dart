import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/main.dart';
import 'package:task_1/router/router_class.dart';
import 'package:task_1/screens/homeScreen/home_screen.dart';
import 'package:task_1/screens/loginScreen/widget_login.dart';
import 'package:task_1/screens/widgets/app_bar.dart';
import 'package:task_1/utilities/colors.dart';
import 'package:task_1/utilities/media_query.dart';
import '../../session/session_class.dart';
import '../../session/session_key.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async{
        context.go(RouterName.sliderScreen.path);
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF1A2530),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Column(
              children: [
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                 child: Row(
                   children: [
                     iconBox(Icons.arrow_back_ios),
                   ],
                 ),
               ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height:height(context)*0.06),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                "Hello Again!",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Welcome Back You’ve Been Missed!",
                                style: GoogleFonts.poppins(
                                  color: AppColors.grey,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 60),

                        // Email Field
                        Text(
                          "Email Address",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                         SizedBox(height: 8),
                        emailField(context),/// Email field
                         SizedBox(height: 30),
                        Text(
                          "Password",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                         SizedBox(height: 10),
                        passwordField(),/// Password field
                         SizedBox(height: 10),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              context.push(RouterName.forgotPassScreen.path);
                            },
                            child: Text(
                              "Recovery Password",
                              style: GoogleFonts.poppins(
                                color: Colors.white54,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 10),
                        // Sign In Button
                        signInButton(),
                         SizedBox(height: 20),

                        Image.asset(
                          "assets/images/Button.png",
                          height: 60,
                          width: 500,
                          fit: BoxFit.fill,
                        ),

                        SizedBox(height:140),

                        Center(
                          child: GestureDetector(
                            onTap: () {
                              context.push(RouterName.signupScreen.path);
                            },
                            child: Text.rich(
                              TextSpan(
                                text: "Don’t Have An Account? ",
                                style: GoogleFonts.poppins(
                                  color: Colors.white54,
                                  fontSize: 13,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Sign Up For Free",
                                    style: GoogleFonts.poppins(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



