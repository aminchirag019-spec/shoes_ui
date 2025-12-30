import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final VoidCallback onProfileTap;
  final ValueChanged<int> onTabSelected;

  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onProfileTap,
    required this.onTabSelected,
  });

  static const _items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Fav',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      label: 'Notif',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: _handleTap,
      items: _items,
    );
  }

  void _handleTap(int index) {
    if (index == 3) {
      onProfileTap();
    } else {
      onTabSelected(index);
    }
  }
}
