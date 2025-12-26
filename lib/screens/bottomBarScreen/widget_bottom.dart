import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/router/router_class.dart';
import 'package:task_1/utilities/colors.dart';
import 'package:task_1/utilities/media_query.dart';


class NavIcon extends StatelessWidget {
  final IconData icon;
  final int index;
  final int selected;
  final Function(int) onTap;
  final bool isOpen; //// Added to switch icon color

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
        color: isSelected
            ? const Color(0xFF5AA8FF)
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
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        boxShadow: [
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 1,
            backgroundColor: isOpen ? Colors.white :  Color(0xFF1E2A33),
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

class OldCustomBottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
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
    return  SizedBox(
      height: height(context)* 0.09, // 🔥 increase height to allow FAB overflow
      child: CustomPaint(
        painter: NavBarPainter(   color: isOpen ? Colors.white : const Color(0xff161F28),),
        child: SafeArea(
          top: false,
          child: Stack(
            clipBehavior: Clip.none, // ✅ IMPORTANT
            alignment: Alignment.bottomCenter,
            children: [

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24,vertical:height(context)*0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _item(Icons.home_outlined, 0),
                    _item(Icons.favorite_border_outlined, 1),

                    const SizedBox(width: 72),

                    _item(Icons.notifications_rounded, 2),
                    GestureDetector(
                      onTap: onProfileTap,
                      child: Image.asset(
                        "assets/images/user.png",
                        width: 26,
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: -20, // adjust freely now
                child: GestureDetector(
                    onTap: () {
                    context.push(RouterName.mycartScreen.path);
                    },
                    child: Fab(isOpen: true,)),
              ),
            ],
          ),
        ),
      ),
    );

  }

  Widget _item(IconData icon, int index) {
    final bool active = selectedIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Icon(
        icon,
        size: 26,
        color: active ? Colors.blue : Colors.grey,
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
    final double notchRadius = fabRadius + 15;
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

