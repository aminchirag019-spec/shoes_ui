import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/router/router_class.dart';
import 'package:task_1/screens/checkoutScreen/widget_checkout.dart' hide summaryRow;
import 'package:task_1/screens/widgets/app_bar.dart';
import 'package:task_1/utilities/colors.dart';
import 'package:task_1/utilities/media_query.dart';
import 'package:task_1/screens/checkoutScreen/payment_checkout_screen.dart'; // Import added

import '../myCartScreen/widget_myscreen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF15232F),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Row(
                  children: [
                  IconButton(onPressed: () {
                    context.push(RouterName.mycartScreen.path);
                  },
                      icon:iconBox(Icons.arrow_back_ios),),
                    SizedBox(width: 90,),
                    Text("Checkout",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                    ),
                    )
                ],),
              ),
              mapCard(),
              const SizedBox(height: 17),
              Container(
                height: 350,
                decoration: BoxDecoration(
                    color: AppColors.bg,
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  child: Column(
                    children: [
                      summaryRow("Subtotal", "\$1250.00"),
                      summaryRow("Shopping", "\$40.90"),
                      const Divider(color: Colors.white30, height: 30),
                      summaryRow("Total Cost", "\$1690.99", isBold: true),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: width(context) * 0.9,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          onPressed: () {
                            // OPENS THE DIALOG FROM payment_checkout_screen.dart
                            showDialog(
                              context: context,
                              builder: (context) => const PaymentCheckoutScreen(),
                            );
                          },
                          child: const Text(
                            "Payment",
                            style: TextStyle(color: AppColors.white, fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
