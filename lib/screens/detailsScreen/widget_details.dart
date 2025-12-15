import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utilities/colors.dart';
import '../../utilities/icons.dart';
import '../homeScreen/widget_home.dart';

Widget topBar() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 6),
            child: Icon(GIcons.back,
            size: 30,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 10),
            child: Text("Men's Shoes",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white
            ),
            ),
          ),
          Icon(GIcons.lock,
            size:30,
          color: Colors.white,
          )
        ],
      ),
      Container(
         height: 250,
         width: 300,
         child: Image(image: AssetImage("assets/images/shoes_4.png"),
         ),
       ),
      SizedBox(
        height: 540,
        child: Expanded(
          child: Container(
            decoration:BoxDecoration(
              color: Color(0xFF161F28)

            ),
          ),
        ),
      )
    ],
  );
}


Widget buildBottomBar() {
  return BottomAppBar(
      color: const Color(0xFF07151A),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Price',
                        style: GoogleFonts.poppins(color: Colors.white60)),
                    const SizedBox(height: 6),
                    Text('\$849.69',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  ]),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28))),
              child: Text('Add To Cart',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      )
  );
}



Widget featureBox(IconData icon, String label) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    decoration: BoxDecoration(
        color: const Color(0xFF071B20),
        borderRadius: BorderRadius.circular(12)),
    child: Row(children: [
      Icon(icon, color: Colors.white70, size: 18),
      const SizedBox(width: 8),
      Text(label, style: GoogleFonts.poppins(color: Colors.white70))
    ]),
  );
}



Widget iconBox(IconData icon) {
  return Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
        color:AppColors.bg,
        borderRadius: BorderRadius.circular(30)),
    child: Center(child: Icon(icon, color: Colors.white70,size: 15,)),
  );
}

Widget sizeSelection(){
  return StatefulBuilder(builder: (context, setState) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Size',
            style: GoogleFonts.poppins(
                color: Colors.white70,
                fontWeight: FontWeight.w600)),
        Row(children: [
          Text('EU',
              style: GoogleFonts.poppins(
                  color: Colors.white54, fontSize: 12)),
          const SizedBox(width: 8),
          Text('US',
              style: GoogleFonts.poppins(
                  color: Colors.white54, fontSize: 12)),
          const SizedBox(width: 8),
          Text('UK',
              style: GoogleFonts.poppins(
                  color: Colors.white54, fontSize: 12)),
        ])
      ],
    );
  },);
}
