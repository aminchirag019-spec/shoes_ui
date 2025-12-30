import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_1/utilities/colors.dart';
import '../../auth/google_signin.dart';
import '../../main.dart';
import '../../router/router_class.dart';
import '../../session/session_class.dart';
import '../../session/session_key.dart';

final formKey = GlobalKey<FormState>();

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();


/// Email validator
String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty || !value.contains("@")) {
    return 'Please enter email';
  }
  return null;
}

/// Password validator
String? validatePassword(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter password';
  }
  if (value.trim().length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}
/// Email Text Form Field
Widget emailField(BuildContext context){
  return TextFormField(
    controller: emailController,
    onChanged: (value) {
      if (value.isNotEmpty){
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
      }
    },
    validator: validateEmail,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: "Enter your email",
      hintStyle:  TextStyle(color:Colors.white10),
      filled: true,
      fillColor: const Color(0xFF161F28),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
    ),
  );
}


bool obscurePassword = true;
///Password Text Form FIeld
 Widget passwordField(){
   return StatefulBuilder(builder:(context, setState) {
     return TextFormField(
       controller: passwordController,
       obscureText: obscurePassword,
       validator: validatePassword,
       style: const TextStyle(color: Colors.white),
       decoration: InputDecoration(
         hintText: "Password",
         hintStyle: const TextStyle(color: Colors.white12),
         filled: true,
         fillColor: const Color(0xFF161F28),
         contentPadding: const EdgeInsets.symmetric(
           horizontal: 20,
           vertical: 16,
         ),
         suffixIcon: IconButton(
           icon: Icon(
             obscurePassword
                 ? Icons.visibility_off
                 : Icons.visibility,
             color: Colors.white54,
           ),
           onPressed: () {
             setState(() {
               obscurePassword = !obscurePassword;
             });
           },
         ),
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(30),
           borderSide: BorderSide.none,
         ),
       ),
     );

   },);
 }

 /// Elevated Button
Widget signInButton(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    height: 55,
    child: ElevatedButton(
      onPressed: () async {
        if (!formKey.currentState!.validate()) return;

        await SharedPrefsHelper()
            .saveData(PrefKeys.isLoggedIn, true);

        await SharedPrefsHelper().saveData(
          PrefKeys.loginId,
          emailController.text.trim(),
        );

        if (!context.mounted) return;

        GoRouter.of(context).refresh();
        context.go(RouterName.homeScreen.path);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF5B9EE1),
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
    ),
  );
}

/// Google Sign-In Button
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

void onLogin(BuildContext context, dynamic emailController,GlobalKey<FormState>formkey) async {
// ... validation ...
  if (!formkey.currentState!.validate()) return;
  await SharedPrefsHelper().saveData(PrefKeys.isLoggedIn, true);
  await SharedPrefsHelper().saveData(
      PrefKeys.loginId, emailController.text.trim());
  if (!context.mounted) return;
  GoRouter.of(context).refresh();
  context.push(RouterName.homeScreen.path);
}