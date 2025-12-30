import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/router/router_class.dart';
import 'package:task_1/utilities/colors.dart';
import 'package:task_1/utilities/media_query.dart';

/// =====================
/// NAV ICON
/// =====================
class NavIcon extends StatelessWidget {
  final IconData icon;
  final int index;
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final bool isOpen;

  const NavIcon({
    super.key,
    required this.icon,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
    this.isOpen = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedIndex == index;

    return InkResponse(
      onTap: () => onTap(index),
      radius: 24,
      child: Icon(
        icon,
        size: 22,
        color: isSelected
            ? AppColors.blue
            : (isOpen ? Colors.black54 : const Color(0xFF93A3AD)),
      ),
    );
  }
}
class Fab extends StatelessWidget {
  final bool isOpen;

  const Fab({super.key, this.isOpen = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 72,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 1,
            backgroundColor:
            isOpen ? Colors.white : const Color(0xFF1E2A33),
          ),
          const CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.blue,
            child: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}

class OldCustomBottomBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final VoidCallback onProfileTap;
  final bool isOpen;

  const OldCustomBottomBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.onProfileTap,
    required this.isOpen,
  });

  @override
  Widget build(BuildContext context) {
    final double barHeight = height(context) * 0.09;

    return SizedBox(
      height: barHeight,
      child: CustomPaint(
        painter: NavBarPainter(
          color: isOpen ? Colors.white : const Color(0xff161F28),
        ),
        child: SafeArea(
          top: false,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: height(context) * 0.03,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _navItem(Icons.home_outlined, 0),
                    _navItem(Icons.favorite_border_outlined, 1),
                    const SizedBox(width: 72),
                    _navItem(Icons.notifications_rounded, 2),
                    InkResponse(
                      onTap: onProfileTap,
                      radius: 20,
                      child: Image.asset(
                        "assets/images/user.png",
                        width: 26,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -20,
                child: InkResponse(
                  onTap: () =>
                      context.push(RouterName.mycartScreen.path),
                  radius: 36,
                  child: const Fab(isOpen: true),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, int index) {
    final bool active = selectedIndex == index;

    return InkResponse(
      onTap: () => onTap(index),
      radius: 24,
      child: Icon(
        icon,
        size: 26,
        color: active ? AppColors.blue : Colors.grey,
      ),
    );
  }
}

class NavBarPainter extends CustomPainter {
  final Color color;

  const NavBarPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    const double fabRadius = 36;
    const double notchRadius = fabRadius + 15;
    const double notchDepth = 38;
    const double topCurve = -26;
    const double smoothness = 18;

    final double centerX = size.width / 2;

    path.moveTo(0, topCurve);

    path.quadraticBezierTo(
      centerX * 0.22,
      0,
      centerX - notchRadius - smoothness,
      0,
    );

    path.quadraticBezierTo(
      centerX - notchRadius,
      0,
      centerX - notchRadius + 8,
      notchDepth,
    );

    path.arcToPoint(
      Offset(centerX + notchRadius - 8, notchDepth),
      radius: const Radius.circular(notchRadius),
      clockwise: false,
    );

    path.quadraticBezierTo(
      centerX + notchRadius,
      0,
      centerX + notchRadius + smoothness,
      2,
    );

    path.quadraticBezierTo(
      centerX + (size.width - centerX) * 0.78,
      0,
      size.width,
      topCurve,
    );

    path
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

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
