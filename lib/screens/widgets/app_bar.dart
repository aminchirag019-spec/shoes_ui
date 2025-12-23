import 'package:flutter/material.dart';

import '../../utilities/colors.dart';



Widget iconBox(IconData icon) {
  return Container(
    width: 44,
    height: 44,
    decoration: BoxDecoration(
      color: AppColors.bg,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Padding(
      padding:  EdgeInsets.only(left: 6),
      child: Icon(icon, color: Colors.white70,
        size: 18,
      ),
    ),
  );
}