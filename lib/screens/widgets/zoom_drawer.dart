import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';

import '../../utilities/colors.dart';
import '../homeScreen/home_screen.dart';
import '../homeScreen/widget_home.dart';
import 'bottomNavbar.dart';


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


class MainScreenContent extends StatelessWidget {
  final Widget child;
  final ZoomDrawerController controller;

  const MainScreenContent({
    required this.child,
    required this.controller,
  });

  Widget build(BuildContext context) {
    final drawer = ZoomDrawer.of(context);

    return ValueListenableBuilder<DrawerState>(
      valueListenable: drawer!.stateNotifier, // ✅ correct

      builder: (context, state, _) {
        final bool isOpen = state == DrawerState.open;

        return Scaffold(
          backgroundColor:
          isOpen ? AppColors.white : AppColors.chipBg,
          extendBody: true,
          body: child,

          bottomNavigationBar: BottomNav(
            selectedIndex: _calculateSelectedIndex(context),
            isOpen: isOpen,
            onTabSelected: (index) {
              if (isOpen) {
                drawer.close();
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
          ),
        );
      },
    );
  }

}

int _calculateSelectedIndex(BuildContext context) {
  final location = GoRouterState.of(context).uri.path;

  if (location.startsWith('/FavouriteScreen')) return 1;
  if (location.startsWith('/NotificationScreen')) return 2;
  if (location.startsWith('/ProfileScreen')) return 3;
  return 0;
}



class MainWrapper extends StatefulWidget {
  final Widget child;

  const MainWrapper({
    super.key,
    required this.child,
  });

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  // Drawer controller must live ABOVE ZoomDrawer
  final ZoomDrawerController _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _drawerController,

      // TODO: replace with your real drawer widget
      menuScreen: drawer(),
      borderRadius: 24,
      showShadow: false,
      angle: -12,
      drawerShadowsBackgroundColor: Colors.grey,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      menuBackgroundColor: AppColors.chipBg,

      // Important: child is passed down safely
      mainScreen: MainScreenContent(
        child: widget.child,
        controller: _drawerController,
      ),
    );
  }
}