import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/screens/checkoutScreen/widget_checkout.dart' hide summaryRow;
import 'package:task_1/utilities/colors.dart';
import 'package:task_1/utilities/media_query.dart';

import '../myCartScreen/widget_myscreen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF15232F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF15232F),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () {
            context.push('/MycartScreen');
          },
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: const Text(
            "Checkout",
            style: TextStyle(color: AppColors.white, fontSize: 20),
          ),
        ),
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            mapCard(),
            SizedBox(height: 17,),
            Container(
              height: 350,
              decoration: BoxDecoration(
                color: AppColors.bg,
                borderRadius: BorderRadius.circular(16)
              ),child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
                child: Column(
                children: [
                  summaryRow("Subtotal", "\$1250.00"),
                  summaryRow("Shopping", "\$40.90"),
                  const Divider(color: Colors.white30, height: 30),
                  summaryRow("Total Cost", "\$1690.99", isBold: true),
              SizedBox(height: 30,),
              Container(
                width: width(context)*0.9,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  onPressed: () {
                    context.push('/PaymentCheckoutScreen');
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
    );
  }






}
