import 'package:go_router/go_router.dart';
import 'package:network_aware_package/network_aware_package.dart';
import 'package:task_1/router/router_class.dart';
import 'package:task_1/screens/sliderScreen/sliders_creen.dart';
import 'package:task_1/screens/loginScreen/login_screen.dart';
import 'package:task_1/screens/signupScreen/signup_screen.dart';
import 'package:task_1/screens/forgotPassScreen/forgot_password_screen.dart';
import 'package:task_1/screens/homeScreen/home_screen.dart';
import 'package:task_1/screens/detailsScreen/details_screen.dart';
import 'package:task_1/screens/favoriteScreen/favourite_screen.dart';
import 'package:task_1/screens/myCartScreen/mycart_screen.dart';
import 'package:task_1/screens/checkoutScreen/checkout_screen.dart';
import 'package:task_1/screens/checkoutScreen/payment_checkout_screen.dart';
import 'package:task_1/screens/notificationScreen/notification_screen.dart';
import 'package:task_1/screens/bestSellerScreen/best_seller_screen.dart';
import 'package:task_1/screens/accountSettingScreen/account_setting_screen.dart';
import 'package:task_1/screens/profileScreen/profile_screen.dart';
import 'package:task_1/screens/searchScreen/search_screen.dart';
import 'package:task_1/screens/splashScreen/splash_screen.dart';
import 'package:task_1/screens/widgets/widget_bottom.dart';
import '../connectivity/connectivity_checker.dart';
import '../main.dart';
import '../screens/widgets/zoom_drawer.dart';
import '../session/session_class.dart';
import '../session/session_key.dart';

class LastRouteStore {
  static String? lastPath;
}

final GoRouter approuter = GoRouter(
  initialLocation: RouterName.sliderScreen.path,
  refreshListenable: AppNetworkService.instance,
  redirect: (context, state) {
    final bool isLoggedIn =
        SharedPrefsHelper().getData(PrefKeys.isLoggedIn) ?? false;
    final isOnline = AppNetworkService.instance.isOnline;
    final path = state.uri.path;

    if (isOnline && path != RouterName.splashScreen.path) {
      LastRouteStore.lastPath = path;
    }
    if (!isOnline && path != RouterName.splashScreen.path) {
      return RouterName.splashScreen.path;
    }
    if (isOnline && path == RouterName.splashScreen.path) {
      return LastRouteStore.lastPath;
    }
    if (!isLoggedIn) {
      if (path == RouterName.homeScreen.path) {
        return RouterName.sliderScreen.path;
      }
    }
    if (isLoggedIn) {
      if (path == RouterName.sliderScreen.path ||
          path == RouterName.loginScreen.path) {
        return RouterName.homeScreen.path;
      }
    }
    return null;
  },
  routes: [
    GoRoute(
      path: RouterName.sliderScreen.path,
      builder: (context, state) => SliderScreen(),
    ),
    GoRoute(
      path: RouterName.loginScreen.path,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: RouterName.signupScreen.path,
      builder: (context, state) => Signupscreen(),
    ),
    GoRoute(
      path: RouterName.forgotPassScreen.path,
      builder: (context, state) => ForgotPasswordScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return MainWrapper(child: child);
      },
      routes: [
        GoRoute(
          path: RouterName.homeScreen.path,
          builder: (context, state) => HomeScreen(),
        ),
      ],
    ),
    GoRoute(
      path: RouterName.notificationScreen.path,
      builder: (context, state) => NotificationScreen(),
    ),
    GoRoute(
      path: RouterName.profileScreen.path,
      builder: (context, state) => ProfileScreen(),
    ),
    GoRoute(
      path: RouterName.favouriteScreen.path,
      builder: (context, state) => FavouriteScreen(),
    ),
    GoRoute(
      path: RouterName.detailsScreen.path,
      builder: (context, state) => DetailsScreen(),
    ),
    GoRoute(
      path: RouterName.mycartScreen.path,
      builder: (context, state) => MycartScreen(),
    ),
    GoRoute(
      path: RouterName.checkoutScreen.path,
      builder: (context, state) => CheckoutScreen(),
    ),
    GoRoute(
      path: RouterName.paymentCheckoutScreen.path,
      builder: (context, state) => PaymentCheckoutScreen(),
    ),
    GoRoute(
      path: RouterName.bestSellerScreen.path,
      builder: (context, state) => BestSellerScreen(),
    ),
    GoRoute(
      path: RouterName.accountSettingScreen.path,
      builder: (context, state) => AccountSettingScreen(),
    ),
    GoRoute(
      path: RouterName.searchScreen.path,
      builder: (context, state) => SearchScreen(),
    ),
    GoRoute(
      path: RouterName.splashScreen.path,
      builder: (context, state) => SplashScreen(),
    )
  ],
);
