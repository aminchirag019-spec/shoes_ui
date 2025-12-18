import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/screens/homeScreen/home_screen.dart';
import 'package:task_1/screens/homeScreen/widget_home.dart';
import 'package:task_1/screens/widgets/zoom_drawer.dart';
import 'package:task_1/utilities/colors.dart';
import 'bottomNavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/utilities/colors.dart';
// Uncomment this

class NavIcon extends StatelessWidget {
  final IconData icon;
  final int index;
  final int selected;
  final Function(int) onTap;
  final bool isOpen; // Added to switch icon color

  const NavIcon({
    super.key,
    required this.icon,
    required this.index,
    required this.selected,
    required this.onTap,
    this.isOpen = false,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selected == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Icon(
        icon,
        size: 22,
        // If selected: Blue.
        // If Open (White BG) -> Unselected is Dark Grey.
        // If Closed (Dark BG) -> Unselected is Light Grey.
        color: isSelected
            ? const Color(0xFF5AA8FF)
            : (isOpen ? Colors.black54 : const Color(0xFF93A3AD)),
      ),
    );
  }
}

class Fab extends StatelessWidget {
  final bool isOpen; // Added to blend the outer ring

  const Fab({super.key, this.isOpen = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 8,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer ring: White if drawer is open, Dark Blue if closed
          CircleAvatar(
            radius: 36,
            backgroundColor: isOpen ? Colors.white : const Color(0xFF1E2A33),
          ),
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.blue,
            child: Icon(Icons.shopping_bag_outlined,
                color: AppColors.white, size: 26),
          ),
        ],
      ),
    );
  }
}











class NavBarPainter extends CustomPainter {
  final Color color;

  NavBarPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Path path = Path();

    final double fabRadius = 36;
    final double notchRadius = fabRadius + 12;
    final double notchDepth = 38;
    final double centerX = size.width / 2;
    const double topCurve = -26;
    const double smoothness = 18;

    path.moveTo(0, topCurve);

    path.quadraticBezierTo(
      centerX * 0.22,
      0,
      centerX - notchRadius - smoothness,
      0,
    );

    // LEFT NOTCH CURVE
    path.quadraticBezierTo(
      centerX - notchRadius,
      0,
      centerX - notchRadius + 8,
      notchDepth,
    );

    // CENTER ARC (perfect semicircle)
    path.arcToPoint(
      Offset(centerX + notchRadius - 8, notchDepth),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );

    // RIGHT NOTCH CURVE (mirror)
    path.quadraticBezierTo(
      centerX + notchRadius,
      0,
      centerX + notchRadius + smoothness,
      2,
    );

    // RIGHT OUTER CURVE
    path.quadraticBezierTo(
      centerX + (size.width - centerX) * 0.78,
      0,
      size.width,
      topCurve,
    );

    // BOTTOM
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // SHADOW
    canvas.drawShadow(
      path,
      Colors.black.withOpacity(0.45),
      10,
      true,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant NavBarPainter oldDelegate) =>
      oldDelegate.color != color;
}

