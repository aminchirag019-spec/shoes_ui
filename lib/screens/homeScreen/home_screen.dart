// lib/screens/homeScreen/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:task_1/screens/homeScreen/widget_home.dart';
import 'package:task_1/utilities/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This will now successfully find the controller from MainWrapper.
    final drawerController = ZoomDrawer.of(context);

    if (drawerController == null) {
      return const Scaffold(body: Center(child: Text("ZoomDrawer not found")));
    }

    // ValueListenableBuilder correctly listens to the state here.
    return ValueListenableBuilder<DrawerState>(
      valueListenable: drawerController.stateNotifier,
      builder: (context, state, child) {
        final bool isOpen = state == DrawerState.open;

        // This container changes color based on the drawer's state.
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          color: isOpen ? AppColors.white : AppColors.chipBg,
          child: Scaffold(
            extendBody: true,
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  topBar(
                    iconbutton: () {
                      drawerController.toggle();
                    },
                    isOpen: isOpen,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (isOpen) {
                          drawerController.toggle();
                        }
                      },
                      behavior: HitTestBehavior.translucent,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(bottom: 120),
                        child: AbsorbPointer(
                          absorbing: isOpen,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              searchBar(isOpen: isOpen),
                              const SizedBox(height: 20),
                              brandRow(isOpen : isOpen),
                              const SizedBox(height: 20),
                              sectionHeader("Popular Shoes", isOpen: isOpen),
                              const SizedBox(height: 12),
                              popularShoes(isOpen: isOpen),
                              const SizedBox(height: 20),
                              sectionHeader("New Arrivals", isOpen: isOpen),
                              const SizedBox(height: 12),
                              newArrivalCard(isOpen: isOpen),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

