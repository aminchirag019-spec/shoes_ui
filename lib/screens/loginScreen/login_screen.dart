import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:task_1/router/router_class.dart';
import 'package:task_1/screens/loginScreen/widget_login.dart';
import 'package:task_1/screens/widgets/app_bar.dart';
import 'package:task_1/utilities/colors.dart';
import 'package:task_1/utilities/media_query.dart';

import '../../auth/google_signin.dart';
import '../../session/session_class.dart';
import '../../session/session_key.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback? onSuccess;
  final VoidCallback? onError;

  const LoginScreen({
    super.key,
    this.onSuccess,
    this.onError,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isGoogleLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleGoogleSignIn() async {
    if (isGoogleLoading) return;

    setState(() => isGoogleLoading = true);

    try {
      final user = await GoogleAuthHelper.signInWithGoogle();

      widget.onSuccess?.call();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Google Sign-In failed"),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => isGoogleLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go(RouterName.sliderScreen.path);
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF1A2530),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Row(
                    children: [
                      iconBox(Icons.arrow_back_ios),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height(context) * 0.06),

                        /// Header
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

                        const SizedBox(height: 60),

                        /// Email
                        Text(
                          "Email Address",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        emailField(context),

                        const SizedBox(height: 30),

                        /// Password
                        Text(
                          "Password",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        passwordField(),

                        const SizedBox(height: 10),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              context.push(
                                RouterName.forgotPassScreen.path,
                              );
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

                        const SizedBox(height: 10),
                        signInButton(context),
                        const SizedBox(height: 20),
                        googleSignInButton(context),
                        const SizedBox(height: 140),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              context.push(
                                RouterName.signupScreen.path,
                              );
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
