import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../auth/google_signin.dart';
import '../../router/router_class.dart';
import '../../session/session_class.dart';
import '../../session/session_key.dart';

/// Name field validation
String? _validateName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your name';
  }
  if (value.trim().length < 3) {
    return 'Name must be at least 3 characters';
  }
  return null;
}
/// email field validation
String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter email';
  }
  if (!value.contains('@')) {
    return 'Enter a valid email';
  }
  return null;
}
/// password validation
String? validatePassword(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter password';
  }
  if (value.trim().length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}



/// Name field
Widget nameField(){
  return TextFormField(
    validator: _validateName,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: "Enter your name",
      hintStyle:  TextStyle(color: Colors.white12),
      filled: true,
      fillColor: Color(0xff161F28),
      contentPadding: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
    ),
  );
}


/// Email field
Widget emailField(){
  return  TextFormField(
    style:  TextStyle(color: Colors.white),
    validator: validateEmail,
    decoration: InputDecoration(
      hintText: "Enter your email",
      hintStyle:  TextStyle(color: Colors.white10),
      filled: true,
      fillColor:  Color(0xff161F28),
      contentPadding:  EdgeInsets.symmetric(
          horizontal: 20, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

/// Password field
Widget passwordField(){
  return   TextFormField(
    style: const TextStyle(color: Colors.white),
    validator: validatePassword,
    decoration: InputDecoration(
      hintText: "Password",
      hintStyle:  TextStyle(color: Colors.white10),
      filled: true,
      fillColor: const Color(0xff161F28),
      contentPadding: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

///Sign in button
final formkey = GlobalKey<FormState>();
Widget signinButton(BuildContext context){
  return  ElevatedButton(
    onPressed: () {
      if (formkey.currentState?.validate() ?? false) {
        context.go('/HomeScreen');
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF4C8BF5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
    child: Text(
      "Sign In",
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}

Widget googleSignInButton(BuildContext context) {
  return GestureDetector(
    onTap: () async {
      try {
        final user = await GoogleAuthHelper.signInWithGoogle();
        if (user == null) return;
        await SharedPrefsHelper()
            .saveData(PrefKeys.isLoggedIn, true);

        await SharedPrefsHelper().saveData(
          PrefKeys.loginId,
          user.email ?? '',
        );
        if (!context.mounted) return;
        GoRouter.of(context).refresh();
        context.go(RouterName.homeScreen.path);
      } catch (e) {
        debugPrint("Google Sign-In Error: $e");

        if (!context.mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Google Sign-In failed"),
          ),
        );
      }
    },
    child: Image.asset("assets/images/Button.png",
      width:double.infinity,
    ),
  );
}