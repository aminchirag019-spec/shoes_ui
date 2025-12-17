import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/screens/widgets/widget_bottom.dart';
import 'package:task_1/utilities/bottom_icons.dart';
import 'package:task_1/utilities/colors.dart';

class BottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final bool isOpen;

  const BottomNav({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
    this.isOpen = false,
  });

  @override
  Widget build(BuildContext context) {
    // White background if open
    final Color navBackgroundColor = isOpen ? Colors.white : AppColors.bg;

    return SizedBox(
      height: 110,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned.fill(
            top: 24,
            child: CustomPaint(
              painter: NavBarPainter(color: navBackgroundColor),
            ),
          ),
          Positioned.fill(
            top: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      NavIcon(
                        icon: BottomIcons.home,
                        index: 0,
                        selected: selectedIndex,
                        onTap: onTabSelected,
                        isOpen: isOpen,
                      ),
                      const SizedBox(width: 20),
                      NavIcon(
                        icon: BottomIcons.fav,
                        index: 1,
                        selected: selectedIndex,
                        onTap: onTabSelected,
                        isOpen: isOpen,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      NavIcon(
                        icon:BottomIcons.notifi,
                        index: 2,
                        selected: selectedIndex,
                        onTap: onTabSelected,
                        isOpen: isOpen,
                      ),
                      const SizedBox(width: 20),
                      NavIcon(
                        icon:BottomIcons.person,
                        index: 3,
                        selected: selectedIndex,
                        onTap: onTabSelected,
                        isOpen: isOpen,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -0,
            child: GestureDetector(
              onTap: () {
                context.go('/MycartScreen');
              },
              child: Fab(isOpen: isOpen),
            ),
          ),
        ],
      ),
    );
  }
}


