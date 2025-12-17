import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class PaymentCheckoutScreen extends StatelessWidget {
  const PaymentCheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFF16242A),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 96,
                height: 96,
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: const Center(child: Text('🎉', style: TextStyle(fontSize: 46))),
              ),
              const SizedBox(height: 18),
              const Text(
                "Your Payment Is\nSuccessful",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.pop(context);// close dialog
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('Back To Shopping'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}