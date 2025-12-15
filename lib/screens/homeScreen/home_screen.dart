import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/screens/homeScreen/widget_home.dart';
import 'package:task_1/utilities/colors.dart';
import '../widgets/bottomNavbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/FavouriteScreen')) return 1;
    if (location.startsWith('/NotificationScreen')) return 2;
    if (location.startsWith('/ProfileScreen')) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final drawerController = ZoomDrawer.of(context);

    return ValueListenableBuilder<DrawerState>(
      valueListenable: drawerController!.stateNotifier,
      builder: (context, state, child) {
        final bool isOpen = state == DrawerState.open;

        return AnimatedContainer(
          duration:  Duration(milliseconds: 00),
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
                      ZoomDrawer.of(context)!.toggle();
                    },
                    isOpen: isOpen,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (isOpen) {
                          ZoomDrawer.of(context)!.toggle();
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
                               SizedBox(height: 20),
                              searchBar(isOpen: isOpen),
                               SizedBox(height: 20),
                              brandRow(isOpen: isOpen),
                               SizedBox(height: 20),
                              sectionHeader("Popular Shoes", isOpen: isOpen),
                               SizedBox(height: 12),
                              popularShoes(isOpen: isOpen),
                               SizedBox(height: 20),
                              sectionHeader("New Arrivals", isOpen: isOpen),
                               SizedBox(height: 12),
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
            bottomNavigationBar: BottomNav(
              selectedIndex: selectedIndex(context),
              onTabSelected: (index) {
                if (isOpen) {
                  ZoomDrawer.of(context)!.close();
                  return;
                }
                const routes = [
                  '/HomeScreen',
                  '/FavouriteScreen',
                  '/NotificationScreen',
                  '/ProfileScreen',
                ];
                context.go(routes[index]);
              },
              isOpen: isOpen,
            ),
          ),
        );
      },
    );
  }
}
