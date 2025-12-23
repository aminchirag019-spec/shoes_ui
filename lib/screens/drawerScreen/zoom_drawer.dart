import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/screens/homeScreen/home_screen.dart';
import 'package:task_1/screens/widgets/widget_bottom.dart';
import '../../utilities/colors.dart';
import '../homeScreen/widget_home.dart' show drawer;
import 'bottom_Navbar.dart';
class MainWrapper extends StatefulWidget {
  final Widget child;

  const MainWrapper({super.key, required this.child});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final ZoomDrawerController _controller = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _controller,
      menuScreen: drawer(),
      menuBackgroundColor: AppColors.chipBg,
      borderRadius: 24,
      angle: -12,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      showShadow: false,

      // 👇 IMPORTANT
      mainScreen: ShellScaffold(child: widget.child),
    );
  }
}
class ShellScaffold extends StatelessWidget {
  final Widget child;

  const ShellScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final drawer = ZoomDrawer.of(context);

    return ValueListenableBuilder<DrawerState>(
      valueListenable: drawer!.stateNotifier,
      builder: (context, state, _) {
        final isOpen = state == DrawerState.open;

        return Scaffold(
          extendBody: true,
          backgroundColor: isOpen ? AppColors.white : AppColors.chipBg,

          body: child,

          // ✅ YOUR OLD NAV BAR IS BACK
          bottomNavigationBar: OldCustomBottomBar(
            selectedIndex: _selectedIndex(context),
            isOpen : isOpen,
            onTap: (index) {
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
            onProfileTap: () => drawer.toggle(),
          ),
        );
      },
    );
  }

  int _selectedIndex(BuildContext context) {
    final path = GoRouterState.of(context).uri.path;

    if (path.startsWith('/FavouriteScreen')) return 1;
    if (path.startsWith('/NotificationScreen')) return 2;
    if (path.startsWith('/ProfileScreen')) return 3;
    return 0;
  }
}
