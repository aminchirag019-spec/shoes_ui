import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:task_1/screens/bottomBarScreen/widget_bottom.dart';
import '../../router/router_class.dart';
import '../../utilities/colors.dart';
import '../../utilities/media_query.dart';
import '../homeScreen/widget_home.dart' show drawer, menuItem;
class DrawerScreen extends StatefulWidget {
  final Widget child;

  const DrawerScreen({super.key, required this.child});

  @override
  State<DrawerScreen> createState() => DrawerScreenState();
}

class DrawerScreenState extends State<DrawerScreen> {
  final ZoomDrawerController _controller = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        context.go(RouterName.homeScreen.path);
        return false;
        },
      child: ZoomDrawer(
        controller: _controller,
        menuScreen: drawer(),
        menuBackgroundColor: AppColors.chipBg,
        borderRadius: 24,
        angle: -12,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
        showShadow: false,

        // 👇 IMPORTANT
        mainScreen: ShellScaffold(child: widget.child),
      ),
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
            onProfileTap:() => drawer.toggle(),
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

Widget drawer() {
  return StatefulBuilder(
    builder: (context, setState) {
      return Scaffold(
        backgroundColor: AppColors.chipBg,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: width(context) * 0.06,
              vertical: height(context) * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height(context) * 0.05),

                /// Avatar
                CircleAvatar(
                  radius: width(context) * 0.09,
                  backgroundImage:
                  const AssetImage("assets/images/alissonbecker.png"),
                ),

                SizedBox(height: height(context) * 0.015),

                /// Greeting
                Text(
                  "Hey, 👋",
                  style: TextStyle(
                    color: const Color(0xFF707B81),
                    fontWeight: FontWeight.bold,
                    fontSize: width(context) * 0.045,
                  ),
                ),

                SizedBox(height: height(context) * 0.01),

                /// Name
                Text(
                  "Alisson Becker",
                  style: TextStyle(
                    fontSize: width(context) * 0.05,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: height(context) * 0.04),

                /// Menu Items
                menuItem(context, "assets/images/user.png", "Profile",
                    RouterName.profileScreen.path),
                menuItem(context, "assets/images/home .png", "Home Page",
                    RouterName.homeScreen.path),
                menuItem(context, "assets/images/Frame.png", "My Cart",
                    RouterName.mycartScreen.path),
                menuItem(context, "assets/images/Heart.png", "Favourite",
                    RouterName.favouriteScreen.path),
                menuItem(context, "assets/images/FastDelivery.png", "Orders",
                    RouterName.checkoutScreen.path),
                menuItem(context, "assets/images/Notifications.png",
                    "Notifications", RouterName.notificationScreen.path),
                menuItem(context, "assets/images/Filter.png", "Settings",
                    RouterName.accountSettingScreen.path),

                SizedBox(height: height(context) * 0.04),

                Divider(color: AppColors.white.withOpacity(0.3)),

                SizedBox(height: height(context) * 0.02),

                /// Sign out
                menuItem(
                  context,
                  "assets/images/Signout.png",
                  "Sign Out",
                  '/LoginScreen',
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget menuItem(
    BuildContext context,
    String icon,
    String title,
    String route,
    ) {
  return InkWell(
    borderRadius: BorderRadius.circular(12),
    onTap: () {
      ZoomDrawer.of(context)?.close();
      context.go(route);
    },
    child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: width(context) * 0.04,
      ),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(icon),
            size: width(context) * 0.07,
            color: AppColors.grey,
          ),
          SizedBox(width: width(context) * 0.045),
          Text(
            title,
            style: TextStyle(
              color: AppColors.white,
              fontSize: width(context) * 0.045, // responsive text
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}