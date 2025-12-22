// lib/screens/widgets/bottomNavbar.dart
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int selectedIndex;
  final bool isOpen;
  final VoidCallback onProfileTap; // Capital V
  final Function(int) onTabSelected;

  const BottomNav({
    super.key,
    required this.selectedIndex,
    required this.isOpen,
    required this.onProfileTap,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed, // Keeps items from shifting
      onTap: (index) {
        // IMPORTANT: Change 3 to the index of your profile icon
        if (index == 3) {
          onProfileTap(); // This triggers drawer.toggle() in MainScreenContent
        } else {
          onTabSelected(index);
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Fav'),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notif'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
