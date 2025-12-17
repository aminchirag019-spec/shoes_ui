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
  final Color color; // Added to accept dynamic color

  NavBarPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color; // Use the passed color
    final path = Path();

    final notchRadius = 60.0;
    final centerX = size.width / 2;
    final notchCenterY = 30.0;
    const double topCurveHeight = -22.0;

    path.moveTo(0, topCurveHeight);
    path.quadraticBezierTo(centerX * 0.25, 0, centerX - notchRadius - 12, 0);
    path.quadraticBezierTo(
        centerX - notchRadius - 6, 0,
        centerX - notchRadius + 8, notchCenterY + 8);
    path.arcToPoint(
      Offset(centerX + notchRadius - 8, notchCenterY + 8),
      radius: Radius.circular(notchRadius + 8),
      clockwise: false,
    );
    path.quadraticBezierTo(
        centerX + notchRadius - 6, 0,
        centerX + notchRadius + 12, 0);
    path.quadraticBezierTo(
        centerX + (size.width - centerX) * 0.75,
        0,
        size.width,
        topCurveHeight);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black, 6, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(NavBarPainter oldDelegate) => color != oldDelegate.color;
}
