import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../utilities/colors.dart';
import '../homeScreen/home_screen.dart';
import '../homeScreen/widget_home.dart';


class ZoomShell extends StatefulWidget {
  const ZoomShell({super.key, required this.child});
  final Widget child;

  @override
  State<ZoomShell> createState() => _ZoomShellState();
}

class _ZoomShellState extends State<ZoomShell> {
  final ZoomDrawerController controller = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: controller,
      menuScreen:  drawer(),
      mainScreen: widget.child, // ✅ router controls screen
      borderRadius: 24,
      angle: -12,
      showShadow: false,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      menuBackgroundColor: AppColors.chipBg,
    );
  }
}
