import 'package:flutter/material.dart';

import '../../utilities/colors.dart';



Widget summaryRow(String title, String value, {bool isBold = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
    child: Container(
      color: AppColors.bg,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 22,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    ),
  );
}


Widget infoRow({
  required IconData icon,
  required String title,
  required String subtitle,
}) {
  return Row(
    children: [
      Icon(icon, color: Colors.white70, size: 28),
      const SizedBox(width: 12),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ],
        ),
      ),
      const Icon(Icons.edit, color: Colors.white54, size: 18),
    ],
  );
}


Widget sectionCard({required Widget child}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color:AppColors.bg,
      borderRadius: BorderRadius.circular(20),
    ),
    child: child,
  );
}

Widget mapCard(){
  return StatefulBuilder(builder: (context, setState) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: sectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Contact Information",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            infoRow(
              icon: Icons.email_outlined,
              title: "rumenhussen@gmail.com",
              subtitle: "Email",
            ),
            const SizedBox(height: 15),
            infoRow(
              icon: Icons.phone,
              title: "+88-692-764-269",
              subtitle: "Phone",
            ),
            const SizedBox(height: 20),

            // Address
            const Text(
              "Address",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Newhall St 36, London, 12908 - UK",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 15),

            // Map (Placeholder Box)
            Container(
              height: 140,
              decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(image: AssetImage("assets/images/map.png"),fit: BoxFit.fill)
              ),
              child: const Center(
                child: Icon(Icons.location_on, color: Colors.blue, size: 40),
              ),
            ),
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Payment Method",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),

                Row(
                  children: [
                    Image.network(
                      "https://cdn-icons-png.flaticon.com/512/196/196565.png",
                      height: 28,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        "Paypal Card\n**** 0966 4629",
                        style: TextStyle(color: Colors.white, height: 1.4),
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down, color: Colors.white)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  },);
}